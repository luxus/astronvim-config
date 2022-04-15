return function()
  local set = vim.opt

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

  vim.g.load_black = false
  vim.g.loaded_matchit = true

  -- Auto Commands
  require("user.autocmds").setup()

  -- Mappings
  require("user.mappings").setup()
end
