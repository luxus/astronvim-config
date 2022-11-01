require("nightfox").setup {
  options = {
    dim_inactive = true,
    styles = { comments = "italic" },
    modules = {
      barbar = false,
      dashboard = false,
      fern = false,
      fidget = false,
      gitgutter = false,
      glyph_palette = false,
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
    all = {
      MiniIndentscopeSymbol = { link = "PreProc" },
      NormalFloat = { link = "Normal" },
    },
  },
}
