return {
  module = "neogen",
  cmd = "Neogen",
  config = function() require "user.plugins.neogen.config" end,
  requires = "nvim-treesitter/nvim-treesitter",
}
