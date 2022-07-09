return {
  after = "nvim-lsp-installer",
  config = function() require "user.plugins.clangd_extensions.config" end,
}
