return {
  { "neovim/nvim-lspconfig", dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  } },
  "nanotee/sqls.nvim",
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "mason-lspconfig.nvim" },
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    opts = function() return { server = astronvim.lsp.server_settings "tsserver" } end,
  },
  {
    "p00f/clangd_extensions.nvim",
    dependencies = { "mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function() return { server = astronvim.lsp.server_settings "clangd" } end,
  },
}
