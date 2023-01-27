return {
  opt = {
    conceallevel = 2, -- enable conceal
    linebreak = true, -- linebreak soft wrap at words
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    showbreak = "↪ ",
    spellfile = vim.fn.expand "~/.config/astronvim/lua/user/spell/en.utf-8.add",
    swapfile = false,
    thesaurus = vim.fn.expand "~/.config/astronvim/lua/user/spell/mthesaur.txt",
    wrap = false, -- don't wrap lines
    termguicolors = true, -- True color support
    splitright = true, -- Put new windows right of current
    splitbelow = true, -- Put new windows below current
    timeoutlen = 200,
    shell = "/bin/sh",
  },
  g = {
    lsp_handlers_enabled = false,
    matchup_matchparen_deferred = 1,
  },
}
