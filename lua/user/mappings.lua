return {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<leader>o"] = false, -- focus neo-tree
    ["q:"] = ":",
    ["<S-h>"] = false,
    ["<S-j>"] = false,
    ["<S-k>"] = false,
    ["<S-l>"] = false,
    -- better search
    n = { require("user.utils").better_search "n", desc = "Next search" },
    N = { require("user.utils").better_search "N", desc = "Previous search" },

    ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
  },
  i = {
    -- date/time input
    ["<c-d>"] = { name = "Date/Time" },
    ["<c-d>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
    ["<c-d>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
    ["<c-d>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
    ["<c-d>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
    ["<c-d>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
    ["<c-d>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
  },
}
