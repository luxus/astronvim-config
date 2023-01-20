return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
  },
  --FIX: looks like there is no "has"
  -- ["gK"] = { vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" } },

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
    keys = {
      { "<leader>v", "<cmd>lua require('lsp_lines').toggle()<CR>", desc = "識LSP Lines" },
    },
  },
  { "lvimuser/lsp-inlayhints.nvim", config = true },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    enabled = false,
    config = true,
  },
}
