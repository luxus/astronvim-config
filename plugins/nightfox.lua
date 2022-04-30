return {
  options = {
    dim_inactive = true,
    styles = {
      comments = "italic",
    },
    inverse = {
      match_paren = true,
    },
    modules = {
      barbar = false,
      dashboard = false,
      fern = false,
      fidget = false,
      gitgutter = false,
      illuminate = false,
      lightspeed = false,
      lsp_saga = false,
      lsp_trouble = false,
      modes = false,
      neogit = false,
      nvimtree = false,
      pounce = false,
      sneak = false,
      symbols_outline = false,
    },
  },
  groups = {
    MiniIndentscopeSymbol = { link = "PreProc" },
    NormalFloat = { link = "Normal" },
    TelescopeBorder = { bg = "bg1" },
    TelescopePromptCounter = { link = "TelescopePromptNormal" },
    TelescopePromptPrefix = { link = "TelescopePromptNormal" },
    HighlightURL = { style = "underline" },
    AerialLine = { link = "Search" },
    AerialGuide = { link = "NeoTreeIndentMarker" },
  },
}
