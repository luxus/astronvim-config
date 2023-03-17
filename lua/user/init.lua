local tabpre = "<leader><tab>"
return {
  heirline = { separators = { breadcrumbs = "  ", path = "/" } },
  colorscheme = false,
  options = {
    opt = {
      -- clipboard = "", -- Remove connection to the system clipboard
      timeoutlen = 250,
      backup = false, -- Don't store backup while overwriting the file
      ruler = false, -- Don't show cursor position in command line
      incsearch = true, -- Show search results while typing
      completeopt = "menuone,noinsert,noselect", -- Customize completions
      formatoptions = "qjl1", -- Don't autoformat comments
      splitkeep = "screen", -- Reduce scroll during window
      pumblend = 10, -- Make builtin completion menus slightly transparent
      winblend = 10, -- Make floating windows slightly transparent
      listchars = "extends:…,precedes:…,nbsp:␣", -- Define which helper symbols to show
      list = true, -- Show some helper symbols
    },
    g = { lsp_handlers_enabled = false, matchup_matchparen_deferred = 1 },
  },
  polish = { require "user.autocmds" },
  diagnostics = { update_in_insert = false },
  updater = { channel = "nightly" },
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
    },
    i = {
      -- date/time input
      ["<c-d>"] = { desc = "Date/Time" },
      ["<c-d>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
      ["<c-d>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
      ["<c-d>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
      ["<c-d>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
      ["<c-d>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
      ["<c-d>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
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
  icons = {
    ActiveLSP = "",
    ActiveTS = " ",
    BufferClose = "",
    DapBreakpoint = "",
    DapBreakpointCondition = "",
    DapBreakpointRejected = "",
    DapLogPoint = "",
    DapStopped = "",
    DefaultFile = "",
    Diagnostic = "",
    DiagnosticError = "",
    DiagnosticHint = "",
    DiagnosticInfo = "",
    DiagnosticWarn = "",
    Ellipsis = "",
    FileModified = "",
    FileReadOnly = "",
    FoldClosed = "",
    FoldOpened = "",
    FolderClosed = "",
    FolderEmpty = "",
    FolderOpen = "",
    Git = "",
    GitAdd = "",
    GitBranch = "",
    GitChange = "",
    GitConflict = "",
    GitDelete = "",
    GitIgnored = "",
    GitRenamed = "",
    GitStaged = "",
    GitUnstaged = "",
    GitUntracked = "",
    LSPLoaded = "",
    LSPLoading1 = "",
    LSPLoading2 = "",
    LSPLoading3 = "",
    MacroRecording = "",
    Paste = "",
    Search = "",
    Selected = "",
    TabClose = "",
  },
}
