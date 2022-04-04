local nightly_user = "user." .. (vim.fn.has "nvim-0.7" == 1 and "nightly." or "")

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

  -- Functions
  function _G.toggle_hard_wrap(width)
    if width == nil then
      width = 80
    end
    if set.textwidth._value == 0 then
      set.textwidth = width
      print "Hard Wrap Enabled"
    else
      set.textwidth = 0
      print "Hard Wrap Disabled"
    end
  end

  function _G.toggle_soft_wrap()
    if vim.wo.wrap then
      vim.wo.wrap = false
      print "Soft Wrap Disabled"
    else
      vim.wo.wrap = true
      print "Soft Wrap Enabled"
    end
  end

  -- Auto Commands
  require(nightly_user .. "autocmds").setup()

  -- Mappings
  require(nightly_user .. "mappings").setup()
end
