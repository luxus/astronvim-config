function GUI()
  if vim.g.neovide then
    return false
  else
    return true
  end
end
return {
  { "luxus/astroluxus", dev = true }, -- loading my plugins
  { "astronvim/astrocommunity", dev = false }, -- loading community plugins

  -- colorschemes
  { "AstroNvim/astrotheme", enabled = false }, -- disable default theme
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.colorscheme.everforest", enabled = false },
  { import = "astrocommunity.colorscheme.nightfox", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa", enabled = false },

  { import = "astrocommunity.completion.copilot-lua", enabled = true },
  { import = "astrocommunity.completion.copilot-cmp", enabled = false },

  { import = "astrocommunity.pack.go", enabled = true },
  { import = "astrocommunity.pack.rust", enabled = true },

  { import = "astrocommunity.media.pets-nvim", enabled = true },
  { import = "astrocommunity.media.presence-nvim", enabled = true },
  { import = "astrocommunity.media.vim-wakatime", enabled = true },
  { import = "astrocommunity.scrolling.mini-animate", enabled = GUI() },
  { import = "astrocommunity.scrolling.satellite-nvim", enabled = true },
  { import = "astrocommunity.color.tint-nvim", enabled = true },
  { import = "astrocommunity.media.drop-nvim", enabled = GUI() },
  { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },

  { import = "luxus.pack.typescript", enabled = false },
  { import = "luxus.colorscheme.tokyonight", enabled = false },
  { import = "luxus.colorscheme.onigiri", enabled = false },
  { import = "luxus.lang.python", enabled = false },
  { import = "luxus.lang.nix", enabled = true },
  { import = "luxus.lang.lua", enabled = true },
  { import = "luxus.lang.clangd", enabled = false },
  { import = "luxus.lang.json", enabled = false },
  { import = "luxus.lang.sql", enabled = false },
  { import = "luxus.lang.shell", enabled = true },
  { import = "luxus.lang.tex", enabled = false },

  { "goolord/alpha-nvim", enabled = false }, -- disable starter
  { import = "luxus.ui.ministarter", enabled = true },

  { import = "luxus.ui.ccc", enabled = false },
  { import = "luxus.ui.noice", enabled = GUI() },
  { import = "luxus.ui.glow", enabled = false },
  { import = "luxus.ui.zen-mode", enabled = true },
  { import = "luxus.ui.smartcolumn", enabled = true },
  { import = "luxus.ui.scope", enabled = true },

  { import = "luxus.editor.minicomment", enabled = true },
  { import = "luxus.editor.lsplines", enabled = false },
  { import = "luxus.editor.grapple+portal", enabled = true },
  { import = "luxus.editor.textobjects", enabled = false },
  { import = "luxus.editor.miniai", enabled = true },
  { import = "luxus.editor.minisurround", enabled = true },
  { import = "luxus.editor.minimove", enabled = true },
  { import = "luxus.editor.neoconf", enabled = true },
  { import = "luxus.editor.cutlass", enabled = true },
  { import = "luxus.editor.neogen", enabled = false },
  { import = "luxus.editor.bqf", enabled = false },

  { import = "luxus.tools.chatgpt", enabled = true },
  { import = "luxus.tools.spectre", enabled = true },
  { import = "luxus.tools.iron", enabled = false },
  { import = "luxus.tools.neural", enabled = false },
  { import = "luxus.tools.neorg", enabled = true },
  { import = "luxus.tools.refactoring", enabled = false },
  { import = "luxus.tools.octo", enabled = false },
  { import = "luxus.tools.sg", enabled = false },
  { import = "luxus.tools.fzf", enabled = false },
  { import = "luxus.tools.oil", enabled = false },
  { import = "luxus.tools.overseer", enabled = false },
  { import = "luxus.tools.sniprun", enabled = false },
}
