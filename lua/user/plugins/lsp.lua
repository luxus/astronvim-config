return {
  {
    "neovim/nvim-lspconfig",
    event = "LspAttach",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
  },
  --FIX: looks like there is no "has"
  -- ["gK"] = { vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" } },

  {
    "nanotee/sqls.nvim",
    event = "LspAttach",
  },
  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach", config = true },
  {
    "jose-elias-alvarez/typescript.nvim",
    event = "LspAttach",
  },
  {
    "p00f/clangd_extensions.nvim",
    event = "LspAttach",
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    enabled = true,
    config = true,
    keys = {
      { "<leader>v", "<cmd>lua require('lsp_lines').toggle()<CR>", desc = "識LSP Lines" },
    },
  },
  { "lvimuser/lsp-inlayhints.nvim", config = true },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    enabled = false,
    config = true,
  },
}
