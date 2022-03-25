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
  ["C"] = { "<cmd>bdelete!<cr>", "Close Buffer" },
  ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
  ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
  ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
  ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
  ["r"] = { "<cmd>SendHere<cr>", "Set REPL" },

  a = {
    name = "Annotate",
    ["<cr>"] = { "<cmd>lua require('neogen').generate()<cr>", "Current" },
    c = { "<cmd>lua require('neogen').generate({ type = 'class' })<cr>", "Class" },
    f = { "<cmd>lua require('neogen').generate({ type = 'func' })<cr>", "Function" },
    t = { "<cmd>lua require('neogen').generate({ type = 'type' })<cr>", "Type" },
    F = { "<cmd>lua require('neogen').generate({ type = 'file' })<cr>", "File" },
  },

  f = {
    name = "Telescope",
    ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
    h = { "<cmd>Telescope oldfiles<cr>", "History" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    M = { "<cmd>Telescope media_files<cr>", "Media" },
    n = { "<cmd>Telescope notify<cr>", "Notifications" },
    p = { "<cmd>Telescope project<cr>", "Projects" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
    w = { "<cmd>Telescope live_grep<cr>", "Words" },
  },

  m = {
    name = "Compiler",
    k = { "<cmd>w<cr><cmd>AsyncRun compiler %:p<cr><cr>", "Compile" },
    a = { "<cmd>AsyncRun autocomp %:p<cr><cr>", "Auto Compile" },
    v = { "<cmd>!opout %:p<cr><cr>", "View Output" },
    b = {
      "<cmd>w<cr><cmd>AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -t beamer -o %:r.pdf<cr><cr>",
      "Compile Beamer",
    },
    p = { "<cmd>![[ -e %:r.pdf ]] && pdfpc %:r.pdf<cr><cr>", "Present Output" },
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
    w = { "<cmd>lua _G.toggle_soft_wrap()<cr>", "Toggle Soft Wrapping" },
    W = { "<cmd>lua _G.toggle_hard_wrap()<cr>", "Toggle Hard Wrapping" },
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
    n = { nil },
    r = { nil },
    k = { nil },
    c = { nil },
    p = { "Next Parameter" },
    P = { "Previous Parameter" },
  },

  n = {
    name = "Notes",
    b = { "<cmd>lua require('zk.commands')('ZkBacklinks')()<cr>", "Backlink Picker" },
    d = { "<cmd>lua require('zk.commands')('ZkCd')()<cr>", "Change Directory" },
    r = { "<cmd>lua require('zk.commands')('ZkIndex')()<cr>", "Refresh Index" },
    l = { "<cmd>lua require('zk.commands')('ZkLinks')()<cr>", "Link Picker" },
    s = { "<cmd>lua require('zk.commands').get('ZkNotes')({ sort = { 'modified' } })<cr>", "Search" },
    n = {
      "<cmd>lua require('zk.commands').get('ZkNew')({ dir = 'personal', title = vim.fn.input('Title: ') })<cr>",
      "New Personal Note",
    },
    N = {
      "<cmd>lua require('zk.commands').get('ZkNew')({ dir = 'work', title = vim.fn.input('Title: ') })<cr>",
      "New Work Note",
    },
    t = { "<cmd>lua require('zk.commands').get('ZkTags')()<cr>", "Tags" },
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
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    l = { "<cmd>lua require'dapui'.float_element('breakpoints')<cr>", "List Breakpoints" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Close Session" },
    Q = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "REPL" },
    s = { "<cmd>lua require'dapui'.float_element('scopes')<cr>", "Scopes" },
    t = { "<cmd>lua require'dapui'.float_element('stacks')<cr>", "Threads" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle Debugger UI" },
    w = { "<cmd>lua require'dapui'.float_element('watches')<cr>", "Watches" },
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
    s = { ":'<,'>lua require('zk.commands').get('ZkMatch')()<cr>", "Search" },
    n = {
      ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'personal' })<cr>",
      "New Personal Note From Title",
    },
    N = {
      ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'work' })<cr>",
      "New Work Note From Title",
    },
    W = {
      ":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'work', title = vim.fn.input('Title: ') })<cr>",
      "New Work Note From Content",
    },
    C = {
      ":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'personal', title = vim.fn.input('Title: ') })<cr>",
      "New Personal Note From Content",
    },
    x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
    X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
    ["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
  },

  x = {
    name = "Debugger",
    e = { "<cmd>lua require('dapui').eval()<cr>", "Evaluate Line" },
  },
}

local Gmappings = {
  d = { "Go to definition" },
  D = { "Go to declaration" },
  I = { "Go to implementation" },
  r = { "Go to references" },
  o = { "Open diagnostic" },
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

which_key.register(Gmappings, opts("n", "g"))
which_key.register(Vmappings, opts("v", "<leader>"))
which_key.register(NextBracketmappings, opts("n", "]"))
which_key.register(PrevBracketmappings, opts("n", "["))

return Nmappings
