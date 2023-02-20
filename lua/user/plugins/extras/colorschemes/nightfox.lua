return {
  { "AstroNvim/astrotheme", enabled = false },
  {
    "EdenEast/nightfox.nvim",
    opts = {},
    config = function()
      local hour = tonumber(os.date "%H")
      local theme = hour >= 6 and hour <= 18 and "nordfox" or "nightfox"
      vim.cmd("colorscheme " .. theme)
    end,
    priority = 1000,
    lazy = false,
  },
}
