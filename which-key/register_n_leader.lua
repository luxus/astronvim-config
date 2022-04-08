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
  ["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },

  a = {
    name = "Annotate",
    ["<cr>"] = {
      function()
        require("neogen").generate()
      end,
      "Current",
    },
    c = {
      function()
        require("neogen").generate { type = "class" }
      end,
      "Class",
    },
    f = {
      function()
        require("neogen").generate { type = "func" }
      end,
      "Function",
    },
    t = {
      function()
        require("neogen").generate { type = "type" }
      end,
      "Type",
    },
    F = {
      function()
        require("neogen").generate { type = "file" }
      end,
      "File",
    },
  },

  f = {
    name = "Telescope",
    ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
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
    o = { nil },
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
    w = { _G.toggle_soft_wrap, "Toggle Soft Wrapping" },
    W = { _G.toggle_hard_wrap, "Toggle Hard Wrapping" },
    m = { "<cmd>Glow<cr>", "Preview Markdown" },
    M = {
      function()
        require("nabla").popup()
      end,
      "Preview Math",
    },
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
    b = {
      function()
        require "zk.commands" "ZkBacklinks"()
      end,
      "Backlink Picker",
    },
    d = {
      function()
        require "zk.commands" "ZkCd"()
      end,
      "Change Directory",
    },
    r = {
      function()
        require "zk.commands" "ZkIndex"()
      end,
      "Refresh Index",
    },
    l = {
      function()
        require "zk.commands" "ZkLinks"()
      end,
      "Link Picker",
    },
    s = {
      function()
        require("zk.commands").get "ZkNotes" { sort = { "modified" } }
      end,
      "Search",
    },
    n = {
      function()
        require("zk.commands").get "ZkNew" { dir = "personal", title = vim.fn.input "Title: " }
      end,
      "New Personal Note",
    },
    N = {
      function()
        require("zk.commands").get "ZkNew" { dir = "work", title = vim.fn.input "Title: " }
      end,
      "New Work Note",
    },
    t = {
      function()
        require("zk.commands").get "ZkTags"()
      end,
      "Tags",
    },
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
    b = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    B = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear Breakpoints",
    },
    c = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    i = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    l = {
      function()
        require("dapui").float_element "breakpoints"
      end,
      "List Breakpoints",
    },
    o = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    q = {
      function()
        require("dap").close()
      end,
      "Close Session",
    },
    Q = {
      function()
        require("dap").terminate()
      end,
      "Terminate",
    },
    r = {
      function()
        require("dap").repl.toggle()
      end,
      "REPL",
    },
    s = {
      function()
        require("dapui").float_element "scopes"
      end,
      "Scopes",
    },
    t = {
      function()
        require("dapui").float_element "stacks"
      end,
      "Threads",
    },
    u = {
      function()
        require("dapui").toggle()
      end,
      "Toggle Debugger UI",
    },
    w = {
      function()
        require("dapui").float_element "watches"
      end,
      "Watches",
    },
    x = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Inspect",
    },
  },
}

local Dmappings = {
  n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
  x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
  f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
  X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
  F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
  d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
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
    e = {
      function()
        require("dapui").eval()
      end,
      "Evaluate Line",
    },
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
which_key.register(Dmappings, opts("i", "<c-d>"))
which_key.register(NextBracketmappings, opts("n", "]"))
which_key.register(PrevBracketmappings, opts("n", "["))

return Nmappings
