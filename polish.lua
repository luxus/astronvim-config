return function()
  local set = vim.opt
  local g = vim.g

  -- Options
  -- show whitespace characters
  set.list = true
  set.listchars = {
    tab = "│→",
    extends = "⟩",
    precedes = "⟨",
    trail = "·",
    nbsp = "␣",
  }
  set.showbreak = "↪ "
  -- enable conceal
  set.conceallevel = 2
  -- soft wrap lines
  set.wrap = true
  -- linebreak soft wrap at words
  set.linebreak = true
  -- set spell and thesaurus files
  set.spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add"
  set.thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt"
  -- set Treesitter based folding and disable auto-folding on open
  set.foldenable = false
  set.foldmethod = "expr"
  set.foldexpr = "nvim_treesitter#foldexpr()"

  g.load_black = false
  g.loaded_matchit = true

  -- Auto Commands
  require("user.autocmds").setup()

  -- Mappings
  require("user.mappings").setup()

  -- Filetypes
  require("user.filetype").setup()
end
