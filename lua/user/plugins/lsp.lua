return {
  {
    "neovim/nvim-lspconfig",
    event = "LspAttach",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      "mason-lspconfig.nvim",
      "nlsp-settings.nvim",
    },
  },
  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach", config = true },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    enabled = true,
    config = true,
    keys = {
      {
        "<leader>v",
        "<cmd>lua require('lsp_lines').toggle()<CR>",
        desc = "識LSP Lines",
      },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    event = "LspAttach",
  },

  {
    "nanotee/sqls.nvim",
    event = "LspAttach",
  },

  {
    "p00f/clangd_extensions.nvim",
    event = "LspAttach",
  },
}
