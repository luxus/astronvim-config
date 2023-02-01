return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "cssls",
        "intelephense",
        "marksman",
        "sumneko_lua",
        "yamlls",
      },

    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "shellcheck",
        "stylua",
        "black",
        "isort",
        "prettierd",
        "shfmt",
        "shellcheck",
      },
    },
    config = function(...)
      require "plugins.configs.mason-null-ls"(...)
      local null_ls = require "null-ls"
      require("mason-null-ls").setup_handlers {
        prettierd = function()
          null_ls.register(
            null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
          )
        end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_setup = true,
      ensure_installed = {
        "bash",
        "cppdbg",
        "delve",
        "js",
        "php",
        "python",
      },
    },
  },
}
