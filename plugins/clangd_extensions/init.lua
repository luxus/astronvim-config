return {
  after = "mason-lspconfig.nvim",
  config = function() require "user.plugins.clangd_extensions.config" end,
}
