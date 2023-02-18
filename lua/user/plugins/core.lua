return {
  -- disable some stuff
  { "famiu/bufdelete.nvim", enabled = true },

  { "max397574/better-escape.nvim", enabled = false },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-BS>", mode = { "t" }, "<C-\\><C-n>", desc = "Terminal normal mode" },
      { "<esc><esc>", mode = { "t" }, "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
    opts = { terminal_mappings = false },
  },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = function()
      require("neodim").setup {
        alpha = 0.75,
        blend_color = "#000000",
        update_in_insert = {
          enable = true,
          delay = 100,
        },
        hide = {
          virtual_text = true,
          signs = true,
          underline = true,
        },
      }
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "core.utils.status"
      opts.statusline[9] = status.component.lsp { lsp_progress = false }
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.git_diff(),
        status.component.diagnostics { padding = { left = 0 } },

        status.component.separated_path {
          padding = { left = 0 },
          path_func = status.provider.filename { modify = ":.:h" },
        },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = { padding = { left = 0, right = 0 } },
        },
        status.component.breadcrumbs {
          icon = { hl = true },
          prefix = true,
          padding = { left = 0 },
        },
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.nav { percentage = false, scrollbar = false },
        status.component.mode { surround = { separator = "right" } },
      }
      opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
      opts.winbar[2][1] = status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } }
      opts.winbar[3] = {
        status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
          file_modified = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbar", true),
          surround = false,
          update = "BufEnter",
        },
        status.component.breadcrumbs {
          icon = { hl = true },
          hl = status.hl.get_attributes("winbar", true),
          prefix = true,
          padding = { left = 0 },
        },
      }
      opts.winbar = nil
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "andymass/vim-matchup",
      },
      "HiPhish/nvim-ts-rainbow2",
      { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      matchup = { enable = true },
      rainbow = { enable = true },
      ensure_installed = {},
      auto_install = vim.fn.executable "tree-sitter" == 1,
      highlight = { disable = { "help", "latex" } },
      indent = { enable = true, disable = { "python" } },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    init = function() table.insert(astronvim.file_plugins, "nvim-ufo") end,
    opts = {
      provider_selector = function(_, filetype, buftype)
        if filetype == "" or buftype == "nofile" then
          return "indent"
        else
          return { "treesitter", "indent" }
        end
      end,
    },
    keys = {
      { "zR", require("ufo").openAllFolds },
      { "zM", require("ufo").closeAllFolds },
      { "zr", require("ufo").openFoldsExceptKinds },
      { "zm", require("ufo").closeFoldsWith },
      { "zp", require("ufo").peekFoldedLinesUnderCursor, desc = "Peek Fold" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {},
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "prettierd",
      },
      config = function(_, opts)
        local mason_null_ls = require "mason-null-ls"
        local null_ls = require "null-ls"
        mason_null_ls.setup(opts)
        mason_null_ls.setup_handlers {
          taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
          prettierd = function()
            null_ls.register(
              null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
            )
          end,
        }
      end,
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_setup = true,
      automatic_installation = true,
      ensure_installed = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    ft = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
  },
  { "theHamsta/nvim-dap-virtual-text", config = true },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      sources = {},
    },
  },
}
