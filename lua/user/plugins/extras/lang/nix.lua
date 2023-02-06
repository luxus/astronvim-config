return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "nix" }) end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "nil_ls",
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts) vim.list_extend(opts.ensure_installed, { "statix", "alejandra", "deadnix" }) end,
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
