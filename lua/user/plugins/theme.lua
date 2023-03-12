return {
  "luxus/colorful-times-nvim",
  lazy = false,
  opts = {
    default = {
      theme = "everforest", -- the default theme to use if no timeframes match
      bg = "dark", -- the default background to use
    },
    timeframes = { -- the timeframes to use
      { theme = "rose-pine", start = "21:58", stop = "03:07" },
      { theme = "everforest", start = "06:10", stop = "16:44", bg = "light" },
      { theme = "tokyonight", start = "16:45", stop = "21:46", bg = "dark" },
    },
  },
}
