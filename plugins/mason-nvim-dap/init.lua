return {
  after = { "mason.nvim", "nvim-dap" },
  config = function() require "user.plugins.mason-nvim-dap.config" end,
}
