return {
  {
    "olexsmir/gopher.nvim",
    config = function()
      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
        },
      }
    end,
    ft = { "go", "gomod" },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    dependencies = {
      { "mfussenegger/nvim-dap", event = "BufEnter *.go" },
      { "theHamsta/nvim-dap-virtual-text", config = true },
      {
        "leoluz/nvim-dap-go",
        config = true,
        ft = { "go", "gomod" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go" },
    },
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = {
      "gomodifytags",
      "impl",
      "iferr",
      "gopls",
    } },
  },
}
