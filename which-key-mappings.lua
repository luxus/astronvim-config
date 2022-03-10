local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local function opts(mode, prefix)
  return {
    mode = mode,
    prefix = prefix,
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }
end

-- Normal Mode <leader> Mappings
local Nmappings = {
  ["c"] = { "Bye Buffer" },
  ["C"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
  ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
  ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
  ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
  ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
  ["r"] = { "<cmd>SendHere<cr>", "Set REPL" },

  l = {
    S = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
  },

  f = {
    name = "Telescope",
    ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    w = { "<cmd>Telescope live_grep<cr>", "Words" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope oldfiles<cr>", "History" },
    t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
    p = { "<cmd>Telescope project<cr>", "Projects" },
    M = { "<cmd>Telescope media_files<cr>", "Media" },
    B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
  },

  m = {
    name = "Compiler",
    k = { "<cmd>w<cr><cmd>AsyncRun compiler %:p<cr><cr>", "Compile" },
    a = { "<cmd>AsyncRun autocomp %:p<cr><cr>", "Auto Compile" },
    v = { "<cmd>!opout %:p<cr><cr>", "View Output" },
    b = {
      "<cmd>w<CR><cmd>AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -t beamer -o %:r.pdf<CR><CR>",
      "Compile Beamer",
    },
    p = { "<cmd>![[ -e %:r.pdf ]] && pdfpc %:r.pdf<CR><CR>", "Present Output" },
    l = { "<cmd>call asyncrun#quickfix_toggle(8)<cr>", "Logs" },
    t = { "<cmd>TexlabBuild<cr>", "LaTeX" },
    f = { "<cmd>TexlabForward<cr>", "Forward Search" },
  },

  d = {
    name = "Document",
    s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
    t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
    p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
    b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
    w = { "<cmd>set wrap!<cr>", "Toggle Wrapping" },
    m = { "<cmd>Glow<cr>", "Preview Markdown" },
    M = { "<cmd>lua require'nabla'.popup()<cr>", "Preview Math" },
  },

  h = {
    name = "Hop",
    c = { "<cmd>HopChar1<cr>", "Character" },
    C = { "<cmd>HopChar2<cr>", "2 Characters" },
    l = { "<cmd>HopLine<cr>", "Line" },
    p = { "<cmd>HopPattern<cr>", "Pattern" },
    w = { "<cmd>HopWord<cr>", "Word" },
  },

  s = {
    name = "Swap",
    b = { nil },
    h = { nil },
    m = { nil },
    r = { nil },
    k = { nil },
    c = { nil },
    p = { "Next Parameter" },
    P = { "Previous Parameter" },
  },

  n = {
    name = "Notes",
    b = { "<cmd>ZkBacklinks<cr>", "Backlink Picker" },
    d = { "<cmd>ZkCd<cr>", "Change Directory" },
    r = { "<cmd>ZkIndex<cr>", "Refresh Index" },
    l = { "<cmd>ZkLinks<cr>", "Link Picker" },
    s = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Search" },
    n = { "<cmd>ZkNew { dir = 'personal', title = vim.fn.input('Title: ') }<cr>", "New Personal Note" },
    N = { "<cmd>ZkNew { dir = 'work', title = vim.fn.input('Title: ') }<cr>", "New Work Note" },
    t = { "<cmd>ZkTags<cr>", "Tags" },
    i = { "<Plug>(simple-todo-new-list-item)", "Insert Todo" },
    I = { "<Plug>(simple-todo-new-list-item-start-of-line)", "Convert to Todo" },
    o = { "<Plug>(simple-todo-below)", "Insert Todo Below" },
    O = { "<Plug>(simple-todo-above)", "Insert Todo Above" },
    x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
    X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
    ["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
  },

  x = {
    name = "Debugger",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    B = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear Breakpoints" },
    l = { "<cmd>lua require'dap'.list_breakpoints()<cr>", "List Breakpoints" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Close Session" },
    Q = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "REPL" },
    x = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Inspect" },
  },
}

local Vmappings = {
  ["/"] = { "Comment" },

  h = {
    name = "Hop",
    c = { "<cmd>HopChar1<cr>", "Character" },
    C = { "<cmd>HopChar2<cr>", "2 Characters" },
    l = { "<cmd>HopLine<cr>", "Line" },
    p = { "<cmd>HopPattern<cr>", "Pattern" },
    w = { "<cmd>HopWord<cr>", "Word" },
  },

  n = {
    name = "Notes",
    s = { ":'<,'>ZkMatch<cr>", "Search" },
    n = { ":'<,'>ZkNewFromTitleSelection { dir = 'personal' }<cr>", "New Personal Note From Title" },
    N = { ":'<,'>ZkNewFromTitleSelection { dir = 'work' }<cr>", "New Work Note From Title" },
    W = {
      ":'<,'>ZkNewFromContentSelection { dir = 'work', title = vim.fn.input('Title: ') }<cr>",
      "New Work Note From Content",
    },
    C = {
      ":'<,'>ZkNewFromContentSelection { dir = 'personal', title = vim.fn.input('Title: ') }<cr>",
      "New Personal Note From Content",
    },
    x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
    X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
    ["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
  },
}

local NextBracketmappings = {
  d = { "Next diagnostic" },
  f = "Next function start",
  x = "Next class start",
  F = "Next function end",
  X = "Next class end",
}

local PrevBracketmappings = {
  d = { "Previous diagnostic" },
  f = { "Previous function start" },
  x = { "Previous class start" },
  F = { "Previous function end" },
  X = { "Previous class end" },
}

which_key.register(Vmappings, opts("v", "<leader>"))
which_key.register(NextBracketmappings, opts("n", "]"))
which_key.register(PrevBracketmappings, opts("n", "["))

return Nmappings
