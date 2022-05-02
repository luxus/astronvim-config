vim.opt.conceallevel = 2 -- enable conceal
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set Treesitter based folding
vim.opt.foldmethod = "expr"
vim.opt.linebreak = true -- linebreak soft wrap at words
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }
vim.opt.shortmess:append { I = true }
vim.opt.showbreak = "↪ "
vim.opt.spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add"
vim.opt.thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt"
vim.opt.wrap = true -- soft wrap lines

vim.filetype.add {
  pattern = {
    ["/tmp/neomutt.*"] = "markdown",
  },
}
