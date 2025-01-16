---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "evergarden",
  },
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
