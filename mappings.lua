local mappings = {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<leader>fh"] = false,
    ["<leader>fm"] = false,
    ["<leader>fn"] = false,
    ["<leader>fo"] = false,
    ["<leader>sb"] = false,
    ["<leader>sc"] = false,
    ["<leader>sh"] = false,
    ["<leader>sk"] = false,
    ["<leader>sm"] = false,
    ["<leader>sn"] = false,
    ["<leader>sr"] = false,
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- easy splits
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- resize with arrows
    ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- Treesitter Surfer
    ["<C-down>"] = {
      function() require("syntax-tree-surfer").move("n", false) end,
      desc = "Swap next tree-sitter object",
    },
    ["<C-right>"] = {
      function() require("syntax-tree-surfer").move("n", false) end,
      desc = "Swap next tree-sitter object",
    },
    ["<C-up>"] = {
      function() require("syntax-tree-surfer").move("n", true) end,
      desc = "Swap previous tree-sitter object",
    },
    ["<C-left>"] = {
      function() require("syntax-tree-surfer").move("n", true) end,
      desc = "Swap previous tree-sitter object",
    },
  },
  i = {
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
  },
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
  },
  -- terminal mappings
  t = {
    ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- Tressitter Surfer
    ["J"] = {
      function() require("syntax-tree-surfer").surf("next", "visual") end,
      desc = "Surf next tree-sitter object",
    },
    ["K"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual") end,
      desc = "Surf previous tree-sitter object",
    },
    ["H"] = {
      function() require("syntax-tree-surfer").surf("parent", "visual") end,
      desc = "Surf parent tree-sitter object",
    },
    ["L"] = {
      function() require("syntax-tree-surfer").surf("child", "visual") end,
      desc = "Surf child tree-sitter object",
    },
    ["<C-j>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Surf next tree-sitter object",
    },
    ["<C-l>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Surf next tree-sitter object",
    },
    ["<C-k>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Surf previous tree-sitter object",
    },
    ["<C-h>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Surf previous tree-sitter object",
    },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
  [""] = {
    ["<C-e><C-e>"] = { "<Plug>SendLine", desc = "Send line to REPL" },
    ["<C-e>"] = { "<Plug>Send", desc = "Send to REPL" },
  },
}

-- add more text objects for "in" and "around"
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    mappings[mode]["i" .. char] =
      { string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
    mappings[mode]["a" .. char] =
      { string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
  end
end

return mappings
