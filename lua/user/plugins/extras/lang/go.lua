return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go" },
    },
  },
  {
    "olexsmir/gopher.nvim",
    config = true,
    ft = { "go", "gomod" },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    dependencies = {
      { "mfussenegger/nvim-dap" },
      { "theHamsta/nvim-dap-virtual-text", config = true },
      {
        "leoluz/nvim-dap-go",
        config = true,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "gopls" } },
  },
  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = {
      "gomodifytags",
      "impl",
      "iferr",
    } },
  },
}
