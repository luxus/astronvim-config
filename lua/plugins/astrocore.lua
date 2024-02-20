local tabpre = "<leader><tab>"
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        clipboard = "", -- Remove connection to the system clipboard
        backup = false, -- Don't store backup while overwriting the file
        ruler = false, -- Don't show cursor position in command line
        incsearch = true, -- Show search results while typing
        completeopt = "menuone,noinsert,noselect", -- Customize completions
        listchars = "extends:…,precedes:…,nbsp:␣", -- Define which helper symbols to show
        formatoptions = "qjl1", -- Don't autoformat comments
        splitkeep = "screen", -- Reduce scroll during window
        pumblend = 10, -- Make builtin completion menus slightly transparent
        winblend = 10, -- Make floating windows slightly transparent
        list = true, -- Show some helper symbols
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    mappings = {
      n = {
        ["<leader>o"] = false, -- focus neo-tree
        ["q:"] = ":",

        ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
        ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
        ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
        -- tabs
        [tabpre] = { desc = "󰓩 Tab Managment" },
        [tabpre .. "l"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
        [tabpre .. "f"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },
        [tabpre .. "<tab>"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
        [tabpre .. "]"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
        [tabpre .. "["] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
        -- Copy/paste with system clipboard
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
      },
      i = {
        -- Move with alt in insert, terminal and command
        -- Don't `noremap` in insert mode to have these keybindings behave exactly
        -- like arrows (crucial inside TelescopePrompt)
        ["<M-h>"] = { "<Left>", noremap = false, desc = "Left" },
        ["<M-j>"] = { "<Down>", noremap = false, desc = "Down" },
        ["<M-k>"] = { "<Up>", noremap = false, desc = "Up" },
        ["<M-l>"] = { "<Right>", noremap = false, desc = "Right" },
      },
      v = {
        -- Search inside visually highlighted text. Use `silent = false` for it to
        -- make effect immediately.
        ["g/"] = { "<esc>/\\%V", silent = false, desc = "Search inside visual selection" },
        ["gV"] = { '"`[" . strpart(getregtype(), 0, 1) . "`]"', expr = true, desc = "Visually select changed text" },
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
        -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
        ["*"] = { [[y/\V<C-R>=escape(@", '/\')<CR><CR>]] },
        ["#"] = { [[y?\V<C-R>=escape(@", '?\')<CR><CR>]] },
      },
      t = {
        ["<M-h>"] = { "<Left>", desc = "Left" },
        ["<M-j>"] = { "<Down>", desc = "Down" },
        ["<M-k>"] = { "<Up>", desc = "Up" },
        ["<M-l>"] = { "<Right>", desc = "Right" },
      },
      c = {
        ["<M-h>"] = { "<Left>", silent = false, desc = "Left" },
        ["<M-l>"] = { "<Right>", silent = false, desc = "Right" },
      },
    },
  },
}
