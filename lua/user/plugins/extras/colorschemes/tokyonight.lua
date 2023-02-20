return {
  { "AstroNvim/astrotheme", enabled = false },
  {
    -- There are also colorschemes for the different styles
    -- colorscheme tokyonight-night
    -- colorscheme tokyonight-storm
    -- colorscheme tokyonight-day
    -- colorscheme tokyonight-moon
    "folke/tokyonight.nvim",
    opts = {},
    config = function()
      local hour = tonumber(os.date "%H")
      local flavour = hour >= 6 and hour <= 18 and "storm" or "moon"
      vim.cmd("colorscheme tokyonight-" .. flavour)
    end,
    priority = 1000,
    lazy = false,
  },
}
