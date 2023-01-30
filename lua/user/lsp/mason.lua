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
        -- "neocmake",
        "jsonls",
        "pyright",
        "sqls",
        "sumneko_lua",
        "texlab",
        "tsserver",
        "yamlls",
        --Rust
        "taplo",
        "rust_analyzer",
      },
    },
  },
  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      return {
        on_attach = astronvim.lsp.on_attach,
        sources = {
          nls.builtins.code_actions.statix,
          nls.builtins.formatting.alejandra,
          nls.builtins.diagnostics.deadnix,
        },
      }
    end,
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
