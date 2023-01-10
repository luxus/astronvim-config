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
            return args
          end,
        },
        init = function(self)
          -- initialize sign lookup table
          self.signs = {}
          for _, sign in ipairs(vim.fn.sign_getdefined()) do
            if sign.text then self.signs[sign.text:gsub("%s", "")] = sign end
          end

          -- setup sign handlers
          if not self.sign_handlers then self.sign_handlers = {} end
          local gitsigns = function(_)
            local gitsigns_avail, gitsigns = pcall(require, "gitsigns")
            if gitsigns_avail then vim.schedule(gitsigns.preview_hunk) end
          end
          for _, sign in ipairs { "Topdelete", "Untracked", "Add", "Changedelete", "Delete" } do
            local name = "GitSigns" .. sign
            if not self.sign_handlers[name] then self.sign_handlers[name] = gitsigns end
          end
          local diagnostics = function(args)
            if args.button == "l" then
              vim.schedule(vim.diagnostic.open_float)
            elseif args.button == "m" then
              vim.schedule(vim.lsp.buf.code_action)
            end
          end
          for _, sign in ipairs { "Error", "Hint", "Info", "Warn" } do
            local name = "DiagnosticSign" .. sign
            if not self.sign_handlers[name] then self.sign_handlers[name] = diagnostics end
          end
          local dap_breakpoint = function(_)
            local dap_avail, dap = pcall(require, "dap")
            if dap_avail then vim.schedule(dap.toggle_breakpoint) end
          end
          for _, sign in ipairs { "", "Rejected", "Condition" } do
            local name = "DapBreakpoint" .. sign
            if not self.sign_handlers[name] then self.sign_handlers[name] = dap_breakpoint end
          end
        end,
        condition = function() return vim.opt.number:get() or vim.opt.relativenumber:get() end,
        {
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
            return str
          end,
          on_click = {
            name = "line_click",
            callback = function(self, ...)
              local args = self.click_args(self, ...)
              if args.button == "m" then
                local dap_avail, dap = pcall(require, "dap")
                if dap_avail then dap.toggle_breakpoint() end
              end
            end,
          },
        },
        { provider = " " },
        {
          provider = "%s",
          on_click = {
            name = "sign_click",
            callback = function(self, ...)
              local args = self.click_args(self, ...)
              if args.sign and args.sign.name and self.sign_handlers[args.sign.name] then
                self.sign_handlers[args.sign.name](args)
              end
            end,
          },
        },
        {
          provider = "%C",
          on_click = {
            name = "fold_click",
            callback = function(self, ...) local args = self.click_args(self, ...) end,
          },
        },
      }
    end
    return opts
  end,
}
