return {
  after = "mason-lspconfig.nvim",
  config = function() require "user.plugins.typescript.config" end,
}
