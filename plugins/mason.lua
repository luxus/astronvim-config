return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "cssls",
        "gopls",
        "html",
        "intelephense",
        "marksman",
        "neocmake",
        "jsonls",
        "pyright",
        "sqls",
        "sumneko_lua",
        "texlab",
        "tsserver",
        "yamlls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
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
    config = function(plugin, opts)
      plugin.default_config(opts)
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
