return {
  { "AstroNvim/astrotheme", enabled = false },
  -- you have to change the colorscheme in init.lua as well
  --  onigiri handles the colorschemes, at the moment there are 5 presets.
  -- print(require 'onigiri'.presets)
  -- > mariana
  -- > gruvbox
  -- > kaolin
  -- > solarized
  -- > moonlight
  -- https://github.com/kaiuri/onigiri.nvim
  {
    "JManch/sunset.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
      "kaiuri/onigiri.nvim",
    },
    config = function()
      require("sunset").setup {
        latitude = 48.57,
        longitude = 8.51,
        day_callback = function()
          vim.g.onigiri = {
            theme = require("onigiri").presets.mariana,
          }
        end,
        night_callback = function()
          vim.g.onigiri = {
            theme = require("onigiri").presets.moonlight,
          }
        end,
      }
    end,
  },
}
