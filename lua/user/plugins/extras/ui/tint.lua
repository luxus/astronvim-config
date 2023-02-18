return {
  {
    "levouh/tint.nvim",
    init = function() table.insert(astronvim.file_plugins, "tint.nvim") end,
    opts = {
      tint = -45, -- Darken colors, use a positive value to brighten
      saturation = 0.6, -- Saturation to preserve
    },
  },
}
