return {
  "jondkinney/aider.nvim",
  cmd = "AiderOpen",
  config = function()
    require("aider").setup {
      -- your configuration comes here
      -- if you don't want to use the default settings
      auto_manage_context = true,
      default_bindings = true,
      debug = false, -- Set to true to enable debug logging
    }
  end,
}
