return {
     {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "sumneko_lua" } },
    },
    {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
       "sumneko_lua",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
}
