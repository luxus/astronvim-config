return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python" },
    },
  },
}
