local mappings = {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["q:"] = ":",
    ["]b"] = false,
    ["[b"] = false,

    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },

    --astro core bindings
    ["<S-l>"] = {
      function() astronvim.nav_buf(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() astronvim.nav_buf(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<CR>"] = { function() astronvim.ui.toggle_tabline() end, desc = "Toggle tabline" },

    -- better search
    n = { require("user.utils").better_search "n", desc = "Next search" },
    N = { require("user.utils").better_search "N", desc = "Previous search" },

    -- resize with arrows
    ["<Up>"] = {
      function() require("smart-splits").resize_up(2) end,
      desc = "Resize split up",
    },
    ["<Down>"] = {
      function() require("smart-splits").resize_down(2) end,
      desc = "Resize split down",
    },
    ["<Left>"] = {
      function() require("smart-splits").resize_left(2) end,
      desc = "Resize split left",
    },
    ["<Right>"] = {
      function() require("smart-splits").resize_right(2) end,
      desc = "Resize split right",
    },
    ["<leader>a"] = { name = "Annotate" },
    ["<leader>r"] = { "<cmd>SendHere<cr>", desc = "Set REPL" },
    ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
  },

  i = {
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
    -- date/time input
    ["<c-d>"] = { name = "Date/Time" },
    ["<c-d>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
    ["<c-d>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
    ["<c-d>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
    ["<c-d>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
    ["<c-d>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
    ["<c-d>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
  },
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
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
