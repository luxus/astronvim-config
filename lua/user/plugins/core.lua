return {
  -- disable some stuff
  { "nvim-neo-tree/neo-tree.nvim", version = false, branch = "main" }, -- use mainline neo-tree for testing new fix
  { "max397574/better-escape.nvim", enabled = false },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-q>", mode = { "t" }, "<C-\\><C-n>", desc = "Terminal normal mode" },
      { "<esc><esc>", mode = { "t" }, "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
    opts = { terminal_mappings = false },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.winbar = nil
      -- opts.statusline[9] = astronvim.status.component.lsp { lsp_progress = false }
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        astronvim.status.component.mode(),
        astronvim.status.component.git_branch(),
        -- -- Custom component for grapple
        -- astronvim.status.component.builder {
        --   { provider = status.grapple },
        --   surround = {
        --     separator = "left",
        --   },
        -- },
        astronvim.status.component.file_info { filetype = {}, filename = false, file_modified = false },
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.breadcrumbs(),
        astronvim.status.component.fill(),
        astronvim.status.component.cmd_info(),
        astronvim.status.component.fill(),
        astronvim.status.component.nav(),
        astronvim.status.component.mode { surround = { separator = "right" } },
      }

      opts.tabline[2] =
        astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "andymass/vim-matchup",
        init = function()
          vim.g.matchup_matchparen_deferred = 1

          vim.api.nvim_create_autocmd("FileType", {
            desc = "Disable matchup for julia",
            group = vim.api.nvim_create_augroup("julia_matchup", { clear = true }),
            pattern = "julia",
            callback = function()
              vim.g.matchup_matchparen_enabled = 0
              vim.g.matchup_motion_enabled = 0
              vim.g.matchup_text_obj_enabled = 0
            end,
          })
        end,
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
      rainbow = {
        enable = true,
        disable = { "jsx", "cpp" },
        query = "rainbow-parens",
        max_file_lines = 3000,
      },
      ensure_installed = {},
      auto_install = vim.fn.executable "tree-sitter" == 1,
      highlight = { disable = { "help", "latex" } },
      indent = { enable = true, disable = { "python" } },
      matchup = { enable = true, disable = { "julia" } },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    init = function() table.insert(astronvim.file_plugins, "nvim-ufo") end,
    lazy = true,
    opts = {
      provider_selector = function(_, filetype, buftype)
        if filetype == "" or buftype == "nofile" then
          return "indent"
        else
          return { "treesitter", "indent" }
        end
      end,
    },
    config = function(_, opts)
      require("ufo").setup(opts)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
      vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek Fold" })
    end,
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
      on_attach = astronvim.lsp.on_attach,
    },
  },
}
