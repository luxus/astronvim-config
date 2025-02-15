return {
  -- { "miikanissi/modus-themes.nvim", priority = 1000 },
  -- { "wnkz/monoglow.nvim", priority = 1000 },
  { "sho-87/kanagawa-paper.nvim", priority = 1000 },
  {
    "comfysage/evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      transparent_background = false,
      variant = "medium", -- 'hard'|'medium'|'soft'
      overrides = {}, -- add custom overrides
    },
  },
}
