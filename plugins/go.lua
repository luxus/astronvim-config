require("go").setup {
  lsp_cfg = astronvim.lsp.server_settings "gopls",
  lsp_on_attach = astronvim.lsp.on_attach,
  lsp_keymaps = false,
  lsp_inlay_hints = { enable = false },
}
