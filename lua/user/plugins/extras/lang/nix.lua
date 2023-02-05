return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "nil_ls" },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "statix",
        "alejandra",
        "deadnix",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
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
}
