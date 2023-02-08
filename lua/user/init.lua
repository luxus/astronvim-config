return {
  colorscheme = { "onigiri" },
  diagnostics = {
    virtual_lines = false,
    virtual_text = false,
    signs = true,
    underline = true,
  },
  options = {
    opt = {
      cursorline = true, -- highlight current line
      conceallevel = 2, -- enable conceal
      linebreak = true, -- linebreak soft wrap at words
      list = true, -- show whitespace characters
      listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
      showbreak = "↪ ",
      spellfile = vim.fn.expand "~/.config/astronvim/lua/user/spell/en.utf-8.add",
      swapfile = false,
      thesaurus = vim.fn.expand "~/.config/astronvim/lua/user/spell/mthesaur.txt",
      wrap = false, -- don't wrap lines
      termguicolors = true, -- True color support
      splitright = true, -- Put new windows right of current
      splitbelow = true, -- Put new windows below current
      timeoutlen = 200,
    },
    g = {
      lsp_handlers_enabled = false,
      matchup_matchparen_deferred = 1,
    },
  },
  polish = { require "user.autocmds" },
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "v3", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
  },
  mappings = {
    n = {
      -- disable default bindings
      ["<C-q>"] = false,
      ["<C-s>"] = false,
      ["<C-h>"] = false,
      ["<C-j>"] = false,
      ["<C-k>"] = false,
      ["<C-l>"] = false,
      ["<leader>o"] = false, -- focus neo-tree
      ["q:"] = ":",
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
  },
}
