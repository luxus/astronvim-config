return {
  after = "mason-nvim-dap.nvim",
  config = function() require "user.plugins.nvim-dap-vscode-js.config" end,
}
