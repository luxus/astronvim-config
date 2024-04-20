local tabpre = "<leader><tab>"
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        conceallevel = 1, -- enable conceal
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- Show line numbers
        undofile = true, -- Enable persistent undo (see also `:h undodir`)
        breakindent = true, -- Indent wrapped lines to match line start
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap
        clipboard = "", -- Remove connection to the system clipboard
        splitbelow = true, -- Horizontal splits will be below
        splitright = true, -- Vertical splits will be to the right
        splitkeep = "screen", -- Reduce scroll during window
        fillchars = "eob: ", -- Don't show `~` outside of buffer
        backup = false, -- Don't store backup while overwriting the file
        writebackup = false, -- Don't store backup while overwriting the file
        incsearch = true, -- Show search results while typing
        listchars = {
          trail = "·",
          tab = "│→",
          -- eol = "⤶",
          extends = "⟩",
          precedes = "⟨",
          nbsp = "␣",
          -- space = '❤',
        },
        pumheight = 10, -- Make popup menu smaller
        showbreak = "↪",
        showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
        completeopt = "menuone,noinsert,noselect", -- Customize completions
        pumblend = 10, -- Make builtin completion menus slightly transparent
        winblend = 10, -- Make floating windows slightly transparent
        list = true, -- Show some helper symbols
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    autocmds = {
      auto_spell = {
        {
          event = "FileType",
          desc = "Enable wrap and spell for text like documents",
          pattern = { "gitcommit", "markdown", "text", "plaintex" },
          callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
          end,
        },
      },
      autohide_tabline = {
        {
          event = "User",
          desc = "Auto hide tabline",
          pattern = "AstroBufsUpdated",
          callback = function()
            local new_showtabline = #vim.t.bufs > 1 and 2 or 1
            if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
          end,
        },
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
        [tabpre .. "["] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
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
