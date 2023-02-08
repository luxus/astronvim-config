return {
  -- you have to change the colorscheme in init.lua as well
  {
    "AstroNvim/astrotheme",
    enabled = false,
  },
  {
    "JManch/sunset.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "kaiuri/onigiri.nvim",
      "sainnhe/everforest",
    },
    config = function()
      require("sunset").setup {
        latitude = 48.57,
        longitude = 8.51,
        day_callback = function() vim.cmd "set background=light" end,
        night_callback = function() vim.cmd "set background=dark" end,
      }
    end,
  },
}
