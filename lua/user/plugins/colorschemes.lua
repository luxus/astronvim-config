return {
  { "AstroNvim/astrotheme", enabled = false },
  {
    "kaiuri/onigiri.nvim",
    init = function()
      vim.g.onigiri = {
        theme = {
          Background = {
            default = "#303841",
            emphasis = "#2e353e",
            muted = "#46525c",
          },
          Foreground = {
            default = "#d8dee9",
            emphasis = "#f7f7f7",
            muted = "#a6acb8",
            surface = "#46525c",
          },
          Shade = {
            default = "#2f373f",
            emphasis = "#2e363e",
          },
          Colors = {
            Accent = "#95B2D6",
            Caution = "#f9ae58",
            Danger = "#f97b58",
            Error = "#ec5f66",
            Hint = "#5fb4b4",
            Important = "#fac761",
            Info = "#99c794",
            Note = "#5c99d6",
            Trace = "#cc8ec6",
            Warn = "#ee932b",
          },
        },
      }
    end,
    config = function()
      local hour = tonumber(os.date "%H")
      local theme = hour >= 6 and hour <= 18 and "mariana" or "kaolin"
      vim.g.onigiri = { theme = require("onigiri").presets[theme] }
      vim.cmd "colorscheme onigiri"
    end,
    priority = 1000,
    lazy = false,
  },
}
