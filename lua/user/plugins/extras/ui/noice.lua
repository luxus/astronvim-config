return {
  -- noicer ui
  -- install treesitter for checkhealth happyness
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "bash", "markdown", "markdown_inline", "regex", "vim" })
      end
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      local spinners = require "noice.util.spinners"
      spinners.spinners["mine"] = {
        frames = {
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
        },
        interval = 80,
      }
      return {
        format = {
          spinner = {
            name = "mine",
            hl = "Constant",
          },
        },
        lsp = {
          progress = {
            enabled = true,
            format = {
              { "{data.progress.percentage} ", hl_group = "Comment" },
              { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
              { "{data.progress.title} ", hl_group = "Comment" },
            },
            format_done = {},
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        messages = { enabled = false },
        cmdline = {
          format = {
            filter = { pattern = "^:%s*!", icon = " ", ft = "sh" },
            IncRename = {
              pattern = "^:%s*IncRename%s+",
              icon = " ",
              conceal = true,
              opts = {
                -- relative = "cursor",
                -- size = { min_width = 20 },
                -- position = { row = -3, col = 0 },
                buf_options = { filetype = "text" },
              },
            },
          },
        },
        views = {
          cmdline_popup = {
            border = {
              style = "none",
              padding = { 1, 2 },
            },
            win_options = {
              winblend = 5,
              winhighlight = {
                Normal = "NormalFloat",
                FloatBorder = "NoiceCmdlinePopupBorder",
                IncSearch = "",
                Search = "",
              },
              cursorline = false,
            },
          },
        },
        popupmenu = {
          enabled = true,
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
          {
            filter = {
              event = "msg_show",
              find = "%d+L, %d+B",
            },
            view = "mini",
          },
          {
            view = "cmdline_output",
            filter = { cmdline = "^:", min_height = 5 },
            -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
          },
          {
            filter = { event = "msg_show", kind = "search_count" },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "; before #",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "; after #",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = " lines, ",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "go up one level",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_show",
              find = "yanked",
            },
            opts = { skip = true },
          },
          {
            filter = { find = "No active Snippet" },
            opts = { skip = true },
          },
          {
            filter = { find = "waiting for cargo metadata" },
            opts = { skip = true },
          },
        },
        presets = {
          inc_rename = true,
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          lsp_doc_border = "rounded",
        },
      }
    end,
  },
}
