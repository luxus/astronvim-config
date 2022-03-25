return function()
  local opts = { noremap = true, silent = true }
  local set = vim.opt

  local map = function(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, opts)
  end
  local _map = function(shortcut, command)
    vim.api.nvim_set_keymap("", shortcut, command, {})
  end
  local nmap = function(shortcut, command)
    map("n", shortcut, command)
  end
  local vmap = function(shortcut, command)
    map("v", shortcut, command)
  end
  local imap = function(shortcut, command)
    map("i", shortcut, command)
  end
  local xmap = function(shortcut, command)
    map("x", shortcut, command)
  end
  local tmap = function(shortcut, command)
    map("t", shortcut, command)
  end

  local unmap = function(mode, shortcut)
    vim.api.nvim_del_keymap(mode, shortcut)
  end
  local nunmap = function(shortcut)
    unmap("n", shortcut)
  end
  local vunmap = function(shortcut)
    unmap("v", shortcut)
  end

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

  -- Mappings

  -- Disable some default mappings
  nunmap "<A-j>"
  nunmap "<A-k>"
  nunmap "<C-Down>"
  nunmap "<C-Left>"
  nunmap "<C-Right>"
  nunmap "<C-Up>"
  nunmap "<C-\\>"
  nunmap "<C-q>"
  nunmap "<C-s>"
  nunmap "<leader>d"
  nunmap "<leader>db"
  nunmap "<leader>fb"
  nunmap "<leader>ff"
  nunmap "<leader>fh"
  nunmap "<leader>fo"
  nunmap "<leader>fw"
  nunmap "<leader>h"
  nunmap "<leader>rn"
  nunmap "<leader>sb"
  nunmap "<leader>sc"
  nunmap "<leader>sh"
  nunmap "<leader>sk"
  nunmap "<leader>sm"
  nunmap "<leader>sn"
  nunmap "<leader>sr"
  vunmap "<A-j>"
  vunmap "<A-k>"
  vunmap "<"
  vunmap ">"
  vunmap "J"
  vunmap "K"
  vunmap "p"

  -- disable default terminal mappings
  vim.cmd "autocmd! TermMappings"

  -- resize with arrows
  nmap("<Up>", "<cmd>lua require'smart-splits'.resize_up(2)<cr>")
  nmap("<Down>", "<cmd>lua require'smart-splits'.resize_down(2)<cr>")
  nmap("<Left>", "<cmd>lua require'smart-splits'.resize_left(2)<cr>")
  nmap("<Right>", "<cmd>lua require'smart-splits'.resize_right(2)<cr>")
  -- navigating wrapped lines
  nmap("j", "gj")
  nmap("k", "gk")
  vmap("j", "gj")
  vmap("k", "gk")
  -- easy splits
  nmap("\\", "<cmd>split<cr>")
  nmap("|", "<cmd>vsplit<cr>")
  -- better increment/decrement
  nmap("-", "<c-x>")
  nmap("+", "<c-a>")
  nmap("-", "<c-x>")
  xmap("+", "g<c-a>")
  xmap("-", "g<c-x>")
  -- type template string
  imap(";mk", "<++>")
  imap("<S-Tab>", "<C-V><Tab>")
  -- terminal mappings
  tmap("<leader><esc>", "<c-\\><c-n>")
  tmap("<esc><esc>", "<c-\\><c-n>:q<cr>")
  tmap("<c-h>", "<c-\\><c-n><c-w>h")
  tmap("<c-j>", "<c-\\><c-n><c-w>j")
  tmap("<c-k>", "<c-\\><c-n><c-w>k")
  tmap("<c-l>", "<c-\\><c-n><c-w>l")

  _map("<c-e><c-e>", "<Plug>SendLine")
  _map("<c-e>", "<Plug>Send")

  -- Functions

  function _G.toggle_hard_wrap(width)
    if width == nil then
      width = 80
    end
    if vim.opt.textwidth._value == 0 then
      vim.opt.textwidth = width
      print "Hard Wrap Enabled"
    else
      vim.opt.textwidth = 0
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

  -- date/time abbreviations
  vim.cmd [[
    inoreabbrev ndate <C-r>=strftime("%Y-%m-%d")<cr>
    inoreabbrev xdate <C-r>=strftime("%m/%d/%y")<cr>
    inoreabbrev fdate <C-r>=strftime("%B %d, %Y")<cr>
    inoreabbrev xtime <C-r>=strftime("%H:%M")<cr>
    inoreabbrev ftime <C-r>=strftime("%H:%M:%S")<cr>
    inoreabbrev dts   <C-r>=strftime("%Y/%m/%d %H:%M:%S -")<cr>
  ]]

  -- LSP completion menu trigger
  vim.cmd [[
    inoremap <C-x><C-o> <Cmd>lua require("cmp").complete({config = { sources = { { name = 'nvim_lsp' }}}})<cr>
  ]]

  -- Autocompiler
  vim.cmd [[
    augroup autocomp
      autocmd VimLeave * !autocomp %:p stop
    augroup END
  ]]

  -- Mutt Emails
  vim.cmd [[
    augroup mutt
      autocmd BufNewFile,BufFilePre,BufRead /tmp/neomutt* set filetype=markdown
    augroup END
  ]]

  vim.cmd [[
    augroup rmd
      autocmd BufNewFile,BufFilePre,BufRead *.rmd set filetype=markdown
    augroup END
  ]]

  vim.cmd [[
    autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<cr>
  ]]

  require("user.cmp").setup_sources()
end
