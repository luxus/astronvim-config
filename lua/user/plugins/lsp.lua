return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   event = "LspAttach",
  --   dependencies = {
  --     { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  --     { "mason-lspconfig.nvim", config = true, opts = { automatic_installation = true } },
  --     "tamago324/nlsp-settings.nvim",
  --   },
  -- },
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
        desc = "LSP Lines",
      },
    },
  },
  -- {
  --   "nanotee/sqls.nvim",
  --   event = "LspAttach",
  -- },
  --
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   event = "LspAttach",
  -- },
}
