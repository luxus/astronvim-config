return {
  opt = {
    conceallevel = 2, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "expr",
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    shortmess = vim.opt.shortmess + { I = true },
    showbreak = "↪ ",
    spellfile = vim.fn.expand "~/.config/nvim/lua/user/spell/en.utf-8.add",
    thesaurus = vim.fn.expand "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
  },
  g = {
    matchup_matchparen_deferred = 1,
  },
}
