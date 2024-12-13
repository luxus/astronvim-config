---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "", -- Remove connection to the system clipboard
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        incsearch = true, -- Show search results while typing
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
      },
    },
    mappings = {
      n = {
        ["q:"] = ":",
        ["<M-S-D-h>"] = { "<Left>", desc = "Left" },

        ["<Leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
        ["<Leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
        -- Copy/paste with system clipboard
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
        ["*"] = { [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], desc = "Search bw current visual selection" },
        ["#"] = { [[y?\V<C-R>=escape(@", '?\')<CR><CR>]], desc = "Search fw current visual selection" },
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
