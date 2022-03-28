return {
  setup = function()
    local opts = { noremap = true, silent = true }
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
    imap("<c-x><c-o>", "<cmd>lua require('cmp').complete({config = { sources = { { name = 'nvim_lsp' }}}})<cr>")
    -- terminal mappings
    tmap("<leader><esc>", "<c-\\><c-n>")
    tmap("<esc><esc>", "<c-\\><c-n>:q<cr>")
    tmap("<c-h>", "<c-\\><c-n><c-w>h")
    tmap("<c-j>", "<c-\\><c-n><c-w>j")
    tmap("<c-k>", "<c-\\><c-n><c-w>k")
    tmap("<c-l>", "<c-\\><c-n><c-w>l")

    _map("<c-e><c-e>", "<Plug>SendLine")
    _map("<c-e>", "<Plug>Send")
  end,
}
