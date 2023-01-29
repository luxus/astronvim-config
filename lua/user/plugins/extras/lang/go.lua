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
    "leoluz/nvim-dap-go",
    config = function() require("dap-go").setup() end,
    ft = { "go", "gomod" },
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
      "gopls",
    } },
  },
  { "ray-x/go.nvim", enabled = true, event = "LspAttach", config = true, dependencies = { "ray-x/guihua.lua" } },
}
