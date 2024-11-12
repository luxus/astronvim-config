---@type LazySpec
return {
  "luxus/colorful-times-nvim",
  dev = true,
  lazy = false,
  opts = {
    default = {
      theme = "night-owl",
      background = "system",
    },
    schedule = {
      { start = "01:09", stop = "00:21", colorscheme = "night-owl" },
      -- { start = "20:00", stop = "21:00", colorscheme = "tokyonight" },
    },
  },
}
