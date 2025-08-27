---@type LazySpec | {}
return (vim.g.vscode and {})
  or {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "kanso",
    },
  }
