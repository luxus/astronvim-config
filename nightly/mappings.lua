return {
  setup = function()
    local unmap = vim.keymap.del
    local map = vim.keymap.set

    unmap("n", "<A-j>")
    unmap("n", "<A-k>")
    unmap("n", "<C-Down>")
    unmap("n", "<C-Left>")
    unmap("n", "<C-Right>")
    unmap("n", "<C-Up>")
    unmap("n", "<C-\\>")
    unmap("n", "<C-q>")
    unmap("n", "<C-s>")
    unmap("n", "<leader>d")
    unmap("n", "<leader>db")
    unmap("n", "<leader>fb")
    unmap("n", "<leader>ff")
    unmap("n", "<leader>fh")
    unmap("n", "<leader>fo")
    unmap("n", "<leader>fw")
    unmap("n", "<leader>h")
    unmap("n", "<leader>rn")
    unmap("n", "<leader>sb")
    unmap("n", "<leader>sc")
    unmap("n", "<leader>sh")
    unmap("n", "<leader>sk")
    unmap("n", "<leader>sm")
    unmap("n", "<leader>sn")
    unmap("n", "<leader>sr")
    unmap("v", "<A-j>")
    unmap("v", "<A-k>")
    unmap("v", "<")
    unmap("v", ">")
    unmap("v", "J")
    unmap("v", "K")
    unmap("v", "p")

    -- resize with arrows
    map("n", "<Up>", function()
      require("smart-splits").resize_up(2)
    end)
    map("n", "<Down>", function()
      require("smart-splits").resize_down(2)
    end)
    map("n", "<Left>", function()
      require("smart-splits").resize_left(2)
    end)
    map("n", "<Right>", function()
      require("smart-splits").resize_right(2)
    end)
    -- navigating wrapped lines
    map({ "n", "v" }, "j", "gj")
    map({ "n", "v" }, "k", "gk")
    -- easy splits
    map("n", "\\", "<cmd>split<cr>")
    map("n", "|", "<cmd>vsplit<cr>")
    -- better increment/decrement
    map("n", "-", "<c-x>")
    map("n", "+", "<c-a>")
    map("x", "+", "g<c-a>")
    map("x", "-", "g<c-x>")
    -- type template string
    map("i", ";mk", "<++>")
    map("i", "<S-Tab>", "<C-V><Tab>")

    -- cmp lsp auto complete
    map("i", "<c-x><c-o>", function()
      require("cmp").complete { config = { sources = { { name = "nvim_lsp" } } } }
    end)

    -- terminal mappings
    map("t", "<leader><esc>", "<c-\\><c-n>")
    map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>")
    map("t", "<c-h>", "<c-\\><c-n><c-w>h")
    map("t", "<c-j>", "<c-\\><c-n><c-w>j")
    map("t", "<c-k>", "<c-\\><c-n><c-w>k")
    map("t", "<c-l>", "<c-\\><c-n><c-w>l")

    map("", "<c-e><c-e>", "<Plug>SendLine")
    map("", "<c-e>", "<Plug>Send")
  end,
}
