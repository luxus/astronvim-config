return {
  after = "nvim-lsp-installer",
  config = function() require "user.plugins.typescript.config" end,
}
