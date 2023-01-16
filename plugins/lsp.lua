return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
  },
  {
    "nanotee/sqls.nvim",
  },
  { "lvimuser/lsp-inlayhints.nvim", config = true },
  {
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    "p00f/clangd_extensions.nvim",
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "BufRead",
    enabled = true,
    config = true,
  },
  { "lvimuser/lsp-inlayhints.nvim", config = true },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    enabled = false,
    config = true,
  },
}
