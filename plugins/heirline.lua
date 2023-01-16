return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.tabline[2] =
      astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })

    if vim.fn.has "nvim-0.9" == 1 then
      opts.statuscolumn = {
        static = {
          click_args = function(self, minwid, clicks, button, mods)
            local args = {
              minwid = minwid,
              clicks = clicks,
              button = button,
              mods = mods,
              mousepos = vim.fn.getmousepos(),
            }
            local sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol)
            if sign == " " then sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol - 1) end
            args.sign = self.signs[sign]
            vim.api.nvim_set_current_win(args.mousepos.winid)
            vim.api.nvim_win_set_cursor(0, { args.mousepos.line, 0 })
            vim.pretty_print(args)
            return args
          end,
          handlers = {
            number = function(args)
              if args.mods:find "c" then
                local dap_avail, dap = pcall(require, "dap")
                if dap_avail then vim.schedule(dap.toggle_breakpoint) end
              end
            end,
            fold = function(args)
              local lnum = args.mousepos.line
              if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return end
              vim.cmd.execute("'" .. lnum .. "fold" .. (vim.fn.foldclosed(lnum) == -1 and "close" or "open") .. "'")
            end,
          },
        },
        init = function(self)
          -- initialize sign lookup table
          self.signs = {}
          for _, sign in ipairs(vim.fn.sign_getdefined()) do
            if sign.text then self.signs[sign.text:gsub("%s", "")] = sign end
          end

          -- setup sign handlers
          if not self.handlers then self.handlers = {} end
          -- gitsigns handlers
          local gitsigns = function(_)
            local gitsigns_avail, gitsigns = pcall(require, "gitsigns")
            if gitsigns_avail then vim.schedule(gitsigns.preview_hunk) end
          end
          for _, sign in ipairs { "Topdelete", "Untracked", "Add", "Changedelete", "Delete" } do
            local name = "GitSigns" .. sign
            if not self.handlers[name] then self.handlers[name] = gitsigns end
          end
          -- diagnostic handlers
          local diagnostics = function(args)
            if args.mods:find "c" then
              vim.schedule(vim.lsp.buf.code_action)
            else
              vim.schedule(vim.diagnostic.open_float)
            end
          end
          for _, sign in ipairs { "Error", "Hint", "Info", "Warn" } do
            local name = "DiagnosticSign" .. sign
            if not self.handlers[name] then self.handlers[name] = diagnostics end
          end
          -- DAP handlers
          local dap_breakpoint = function(_)
            local dap_avail, dap = pcall(require, "dap")
            if dap_avail then vim.schedule(dap.toggle_breakpoint) end
          end
          for _, sign in ipairs { "", "Rejected", "Condition" } do
            local name = "DapBreakpoint" .. sign
            if not self.handlers[name] then self.handlers[name] = dap_breakpoint end
          end
        end,
        {
          condition = function() return vim.opt.foldcolumn:get() ~= "0" end,
          provider = function()
            local lnum = vim.v.lnum
            return vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1)
                and (vim.fn.foldclosed(lnum) == -1 and "" or "")
              or " "
          end,
          on_click = {
            name = "fold_click",
            callback = function(self, ...)
              if self.handlers.fold then self.handlers.fold(self.click_args(self, ...)) end
            end,
          },
        },
        {
          condition = function() return vim.opt.number:get() or vim.opt.relativenumber:get() end,
          provider = function()
            local str = "%="
            local num, relnum = vim.opt.number:get(), vim.opt.relativenumber:get()
            if num and not relnum then
              str = str .. "%l"
            elseif relnum and not num then
              str = str .. "%r"
            else
              str = str .. "%{v:relnum?v:relnum:v:lnum}"
            end
            return str .. " "
          end,
          on_click = {
            name = "line_click",
            callback = function(self, ...)
              if self.handlers.number then self.handlers.number(self.click_args(self, ...)) end
            end,
          },
        },
        {
          provider = "%s",
          on_click = {
            name = "sign_click",
            callback = function(self, ...)
              local args = self.click_args(self, ...)
              if args.sign and args.sign.name and self.handlers[args.sign.name] then
                self.handlers[args.sign.name](args)
              end
            end,
          },
        },
      }
    end
    return opts
  end,
}
