if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "avante.nvim",
  enabled = true,
  -- event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    behaviour = {
      auto_suggestions = false,
    },
  },
}
