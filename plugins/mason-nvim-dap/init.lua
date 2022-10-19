return {
  after = { "mason.nvim", "nvim-dap" },
  branch = "autoSetup",
  config = function() require "user.plugins.mason-nvim-dap.config" end,
}
