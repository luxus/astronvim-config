return {
  -- Golang support
  {
    "olexsmir/gopher.nvim",
    opts = function() return { server = astronvim.lsp.config "gopls" } end,
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "gopls", "gomodifytags", "gofumpt", "iferr", "impl", "goimports" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "gopls" } },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    ft = "go",
  },
  { "theHamsta/nvim-dap-virtual-text", ft = "go", config = true },
  {
    "leoluz/nvim-dap-go",
    config = true,
    ft = "go",
    dependencies = {
      { "mfussenegger/nvim-dap" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go" },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "delve" },
    },
  },
}
