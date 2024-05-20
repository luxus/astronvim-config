---@type LazySpec
return {
  {
    "refractalize/oil-git-status.nvim",
    opts = {},
    dependencies = {
      "stevearc/oil.nvim",
      cmd = "Oil",
      init = function() -- start oil on startup lazily if necessary
        if vim.fn.argc() == 1 then
          local arg = vim.fn.argv(0)
          ---@cast arg string
          local stat = vim.loop.fs_stat(arg)
          local adapter = string.match(arg, "^([%l-]*)://")
          if (stat and stat.type == "directory") or adapter == "oil-ssh" then require "oil" end
        end
      end,
      dependencies = {
        {
          "nvim-neo-tree/neo-tree.nvim",
          enabled = false,
          opts = { filesystem = { hijack_netrw_behavior = "disabled" } },
        },
        {
          "AstroNvim/astrocore",
          opts = {
            autocmds = {
              neotree_start = false,
              oil_start = {
                {
                  event = "BufNew",
                  desc = "start oil when editing a directory",
                  callback = function()
                    if package.loaded["oil"] then
                      vim.api.nvim_del_augroup_by_name "oil_start"
                    elseif vim.fn.isdirectory(vim.fn.expand "<afile>") == 1 then
                      require "oil"
                      vim.api.nvim_del_augroup_by_name "oil_start"
                    end
                  end,
                },
              },
              oil_settings = {
                {
                  event = "FileType",
                  desc = "Disable view saving for oil buffers",
                  pattern = "oil",
                  callback = function(args) vim.b[args.buf].view_activated = false end,
                },
                {
                  event = "User",
                  pattern = "OilActionsPost",
                  desc = "Close buffers when files are deleted in Oil",
                  callback = function(args)
                    if args.data.err then return end
                    for _, action in ipairs(args.data.actions) do
                      if action.type == "delete" then
                        local _, path = require("oil.util").parse_url(action.url)
                        local bufnr = vim.fn.bufnr(path)
                        if bufnr ~= -1 then require("astrocore.buffer").wipe(bufnr, true) end
                      end
                    end
                  end,
                },
              },
            },
            mappings = {
              n = {
                ["<Leader>e"] = { "<Cmd>Oil<CR>", desc = "Oil Filebrowser" },
              },
            },
          },
        },
        {
          "rebelot/heirline.nvim",
          opts = function(_, opts)
            local status = require "astroui.status"
            local is_oil = function(bufnr) return status.condition.buffer_matches({ filetype = "^oil$" }, bufnr) end
            local disable_winbar_cb = opts.opts.disable_winbar_cb
            opts.opts.disable_winbar_cb = function(args)
              if is_oil(args.buf) then return false end
              return disable_winbar_cb(args)
            end

            if opts.winbar then
              table.insert(opts.winbar, 1, {
                condition = function(self) return is_oil(self.bufnr) end,
                status.component.separated_path {
                  padding = { left = 2 },
                  max_depth = false,
                  suffix = false,
                  path_func = function() return require("oil").get_current_dir() end,
                },
              })
            end
          end,
        },
      },
      opts = {
        win_options = {
          signcolumn = "yes:2",
        },
        -- git = {
        --   add = true,
        --   mv = true,
        --   rm = true,
        -- },
        skip_confirm_for_simple_edits = true,
        experimental_watch_for_changes = true,
        keymaps = {
          ["<Esc>"] = "actions.close",
        },
      },
    },
  },
}
