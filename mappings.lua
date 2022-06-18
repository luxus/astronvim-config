local map = vim.keymap.set
local unmap = vim.keymap.del
-- remove default bindings
unmap("n", "<C-Down>")
unmap("n", "<C-Left>")
unmap("n", "<C-Right>")
unmap("n", "<C-Up>")
unmap("n", "<C-q>")
unmap("n", "<C-s>")
unmap("v", "<")
unmap("v", ">")
unmap("t", "<esc>")
unmap("t", "jk")
unmap("n", "<leader>c")
unmap("n", "<leader>h")
if astronvim.is_available "toggleterm.nvim" then
  unmap("n", "<C-\\>") -- ToggleTerm
end
if astronvim.is_available "telescope.nvim" then
  unmap("n", "<leader>fh") -- Telescope
  unmap("n", "<leader>fm") -- Telescope
  unmap("n", "<leader>fn") -- Telescope
  unmap("n", "<leader>fo") -- Telescope
  unmap("n", "<leader>sb") -- Telescope
  unmap("n", "<leader>sc") -- Telescope
  unmap("n", "<leader>sh") -- Telescope
  unmap("n", "<leader>sk") -- Telescope
  unmap("n", "<leader>sm") -- Telescope
  unmap("n", "<leader>sn") -- Telescope
  unmap("n", "<leader>sr") -- Telescope
end
-- resize with arrows
map("n", "<Up>", function()
  require("smart-splits").resize_up(2)
end, { desc = "Resize split up" })
map("n", "<Down>", function()
  require("smart-splits").resize_down(2)
end, { desc = "Resize split down" })
map("n", "<Left>", function()
  require("smart-splits").resize_left(2)
end, { desc = "Resize split left" })
map("n", "<Right>", function()
  require("smart-splits").resize_right(2)
end, { desc = "Resize split right" })
-- navigating wrapped lines
map({ "n", "v" }, "j", "gj", { desc = "Nagivate down" })
map({ "n", "v" }, "k", "gk", { desc = "Navigate up" })
-- easy splits
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
-- better increment/decrement
map("n", "-", "<c-x>", { desc = "Descrement number" })
map("n", "+", "<c-a>", { desc = "Increment number" })
map("x", "+", "g<c-a>", { desc = "Increment number" })
map("x", "-", "g<c-x>", { desc = "Descrement number" })
-- line text-objects
map("x", "il", "g_o^", { desc = "Inside line text object" })
map("o", "il", ":normal vil<cr>", { desc = "Inside line text object" })
map("x", "al", "$o^", { desc = "Around line text object" })
map("o", "al", ":normal val<cr>", { desc = "Around line text object" })
-- more in/all objects between 2 characters
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    map(mode, "i" .. char, (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char))
    map(mode, "a" .. char, (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char))
  end
end
-- type template string
map("i", ";mk", "<++>", { desc = "Insert template string" })
map("i", "<S-Tab>", "<C-V><Tab>", { desc = "Tab character" })
-- terminal mappings
map("t", "<c-q>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
map("t", "<esc><esc>", "<c-\\><c-n>:q<cr>", { desc = "Terminal quit" })
map("", "<c-e><c-e>", "<Plug>SendLine", { desc = "Send line to REPL" })
map("", "<c-e>", "<Plug>Send", { desc = "Send to REPL" })
-- Treesitter Surfer
map("x", "J", "<cmd>STSSelectNextSiblingNode<cr>", { desc = "Surf next tree-sitter object" })
map("x", "K", "<cmd>STSSelectPrevSiblingNode<cr>", { desc = "Surf previous tree-sitter object" })
map("x", "H", "<cmd>STSSelectParentNode<cr>", { desc = "Surf parent tree-sitter object" })
map("x", "L", "<cmd>STSSelectChildNode<cr>", { desc = "Surf child tree-sitter object" })
map("x", "<c-j>", "<cmd>STSSwapNextVisual<cr>", { desc = "Surf next tree-sitter object" })
map("x", "<c-l>", "<cmd>STSSwapNextVisual<cr>", { desc = "Surf next tree-sitter object" })
map("x", "<c-k>", "<cmd>STSSwapPrevVisual<cr>", { desc = "Surf previous tree-sitter object" })
map("x", "<c-h>", "<cmd>STSSwapPrevVisual<cr>", { desc = "Surf previous tree-sitter object" })
map("n", "<c-down>", "<cmd>STSSwapDownNormal<cr>", { desc = "Swap next tree-sitter object" })
map("n", "<c-right>", "<cmd>STSSwapDownNormal<cr>", { desc = "Swap next tree-sitter object" })
map("n", "<c-up>", "<cmd>STSSwapUpNormal<cr>", { desc = "Swap previous tree-sitter object" })
map("n", "<c-left>", "<cmd>STSSwapUpNormal<cr>", { desc = "Swap previous tree-sitter object" })
