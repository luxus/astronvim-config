return function()
  -- Options
  -- show whitespace characters
  vim.opt.list = true
  vim.opt.listchars = {
    tab = "│→",
    extends = "⟩",
    precedes = "⟨",
    trail = "·",
    nbsp = "␣",
  }
  vim.opt.showbreak = "↪ "
  -- enable conceal
  vim.opt.conceallevel = 2
  -- soft wrap lines
  vim.opt.wrap = true
  -- linebreak soft wrap at words
  vim.opt.linebreak = true
  -- set spell and thesaurus files
  vim.opt.spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add"
  vim.opt.thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt"
  -- set Treesitter based folding and disable auto-folding on open
  vim.opt.foldenable = false
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

  vim.g.load_black = false
  vim.g.loaded_matchit = true

  -- Auto Commands
  require("user.autocmds").setup()

  -- Mappings
  require("user.mappings").setup()

  -- Filetypes
  require("user.filetype").setup()
end
