return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.statusline[9] = astronvim.status.component.lsp { lsp_progress = false }
    opts.tabline[2] =
      astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })

    if vim.fn.has "nvim-0.9" == 1 then
      -- TODO: implement this API
      -- opts.statuscolumn = {
      --   init = astronvim.status.init.statuscolumn_handlers, -- set up click handlers
      --   astronvim.status.component.foldcolumn,
      --   astronvim.status.component.numbercolumn,
      --   astronvim.status.component.signcolumn,
      -- }
      opts.statuscolumn = {
        { -- create astronvim.status.component.foldcolumn
          condition = astronvim.status.condition.foldcolumn_enabled,
          provider = astronvim.status.provider.foldcolumn(),
          on_click = {
            name = "fold_click",
            callback = function(...)
              local lnum = astronvim.status.utils.statuscolumn_clickargs(...).mousepos.line
              if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return end
              vim.cmd.execute("'" .. lnum .. "fold" .. (vim.fn.foldclosed(lnum) == -1 and "close" or "open") .. "'")
            end,
          },
        },
        { -- create astronvim.status.component.numbercolumn
          condition = astronvim.status.condition.numbercolumn_enabled,
          provider = astronvim.status.provider.numbercolumn { padding = { right = 1 } },
          on_click = {
            name = "line_click",
            callback = function(...)
              local args = astronvim.status.utils.statuscolumn_clickargs(...)
              if args.mods:find "c" then
                local dap_avail, dap = pcall(require, "dap")
                if dap_avail then vim.schedule(dap.toggle_breakpoint) end
              end
            end,
          },
        },
        { -- create astronvim.status.component.signcolumn
          provider = astronvim.status.provider.statuscolumn(),
          on_click = {
            name = "sign_click",
            callback = function(...)
              local args = astronvim.status.utils.statuscolumn_clickargs(...)
              if args.sign and args.sign.name and astronvim.status.env.sign_handlers[args.sign.name] then
                astronvim.status.env.sign_handlers[args.sign.name](args)
              end
            end,
          },
        },
      }
    end
    return opts
  end,
}
