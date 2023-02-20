return {
  { "AstroNvim/astrotheme", enabled = false },
  {
    "sainnhe/everforest",
    config = function()
      local hour = tonumber(os.date "%H")
      local bg = hour >= 6 and hour <= 18 and "light" or "dark"
      vim.cmd("set background=" .. bg)
      vim.cmd "colorscheme everforest"
    end,
    priority = 1000,
    lazy = false,
  },
}
