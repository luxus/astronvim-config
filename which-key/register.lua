local utils = require "user.utils"

return {
  n = {
    ["<leader>"] = {
      ["C"] = { "<cmd>bdelete<cr>", "Close Buffer" },
      ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
      ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
      ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
      ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
      ["r"] = { "<cmd>SendHere<cr>", "Set REPL" },
      ["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },
      ["P"] = { function() utils.toggle_presence() end, "Toggle Presence" },

      a = {
        name = "Annotate",
        ["<cr>"] = { function() require("neogen").generate() end, "Current" },
        c = { function() require("neogen").generate { type = "class" } end, "Class" },
        f = { function() require("neogen").generate { type = "func" } end, "Function" },
        t = { function() require("neogen").generate { type = "type" } end, "Type" },
        F = { function() require("neogen").generate { type = "file" } end, "File" },
      },

      f = {
        name = "Telescope",
        ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
        B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
        e = { "<cmd>Telescope file_browser<cr>", "Explorer" },
        h = { "<cmd>Telescope oldfiles<cr>", "History" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        M = { "<cmd>Telescope media_files<cr>", "Media" },
        n = { "<cmd>Telescope notify<cr>", "Notifications" },
        p = { "<cmd>Telescope project<cr>", "Projects" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
      },

      m = {
        name = "Compiler",
        k = {
          function()
            vim.cmd "silent! write"
            local filename = vim.fn.expand "%:t"
            utils.async_run(
              { "compiler", vim.fn.expand "%:p" },
              function() utils.quick_notification("Compiled " .. filename) end
            )
          end,
          "Compile",
        },
        a = {
          function()
            vim.notify "Autocompile Started"
            utils.async_run(
              { "autocomp", vim.fn.expand "%:p" },
              function() utils.quick_notification "Autocompile stopped" end
            )
          end,
          "Auto Compile",
        },
        v = { function() vim.fn.jobstart { "opout", vim.fn.expand "%:p" } end, "View Output" },
        b = {
          function()
            local filename = vim.fn.expand "%:t"
            utils.async_run({
              "pandoc",
              vim.fn.expand "%",
              "--pdf-engine=xelatex",
              "--variable",
              "urlcolor=blue",
              "-t",
              "beamer",
              "-o",
              vim.fn.expand "%:r" .. ".pdf",
            }, function() utils.quick_notification("Compiled " .. filename) end)
          end,
          "Compile Beamer",
        },
        p = {
          function()
            local pdf_path = vim.fn.expand "%:r" .. ".pdf"
            if vim.fn.filereadable(pdf_path) == 1 then vim.fn.jobstart { "pdfpc", pdf_path } end
          end,
          "Present Output",
        },
        l = { function() utils.toggle_qf() end, "Logs" },
        t = { "<cmd>TexlabBuild<cr>", "LaTeX" },
        f = { "<cmd>TexlabForward<cr>", "Forward Search" },
      },

      d = {
        name = "Document",
        n = { "<cmd>enew<cr>", "New File" },
        s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
        t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
        p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
        b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
        c = { function() utils.vim_opt_toggle("conceallevel", 2, 0, "Conceal") end, "Toggle Conceal" },
        w = { function() utils.vim_opt_toggle("wrap", true, false, "Soft Wrap") end, "Toggle Soft Wrapping" },
        W = { function() utils.vim_opt_toggle("textwidth", 80, 0, "Hard Wrap") end, "Toggle Hard Wrapping" },
        m = { function() require("nabla").popup() end, "Preview Math" },
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
        name = "Surf",
        s = { "<cmd>STSSelectMasterNode<cr>", "Surf" },
        S = { "<cmd>STSSelectCurrentNode<cr>", "Surf Node" },
      },

      n = {
        name = "Notes",
        b = { function() require "zk.commands" "ZkBacklinks"() end, "Backlink Picker" },
        d = { function() require "zk.commands" "ZkCd"() end, "Change Directory" },
        r = { function() require "zk.commands" "ZkIndex"() end, "Refresh Index" },
        l = { function() require "zk.commands" "ZkLinks"() end, "Link Picker" },
        s = { function() require("zk.commands").get "ZkNotes" { sort = { "modified" } } end, "Search" },
        n = {
          function() require("zk.commands").get "ZkNew" { dir = "personal", title = vim.fn.input "Title: " } end,
          "New Personal Note",
        },
        N = {
          function() require("zk.commands").get "ZkNew" { dir = "work", title = vim.fn.input "Title: " } end,
          "New Work Note",
        },
        t = { function() require("zk.commands").get "ZkTags"() end, "Tags" },
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
        b = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
        B = { function() require("dap").clear_breakpoints() end, "Clear Breakpoints" },
        c = { function() require("dap").continue() end, "Continue" },
        i = { function() require("dap").step_into() end, "Step Into" },
        l = { function() require("dapui").float_element "breakpoints" end, "List Breakpoints" },
        o = { function() require("dap").step_over() end, "Step Over" },
        q = { function() require("dap").close() end, "Close Session" },
        Q = { function() require("dap").terminate() end, "Terminate" },
        r = { function() require("dap").repl.toggle() end, "REPL" },
        s = { function() require("dapui").float_element "scopes" end, "Scopes" },
        t = { function() require("dapui").float_element "stacks" end, "Threads" },
        u = { function() require("dapui").toggle() end, "Toggle Debugger UI" },
        w = { function() require("dapui").float_element "watches" end, "Watches" },
        x = { function() require("dap.ui.widgets").hover() end, "Inspect" },
      },
    },
    ["]"] = {
      f = "Next function start",
      x = "Next class start",
      F = "Next function end",
      X = "Next class end",
    },
    ["["] = {
      f = "Previous function start",
      x = "Previous class start",
      F = "Previous function end",
      X = "Previous class end",
    },
    g = {
      t = {
        name = "Treesitter",
        v = {
          function() require("syntax-tree-surfer").targeted_jump { "variable_declaration" } end,
          "Go to Variables",
        },
        f = {
          function() require("syntax-tree-surfer").targeted_jump { "function" } end,
          "Go to Functions",
        },
        i = {
          function()
            require("syntax-tree-surfer").targeted_jump {
              "if_statement",
              "else_clause",
              "else_statement",
              "elseif_statement",
            }
          end,
          "Go to If Statements",
        },
        r = {
          function() require("syntax-tree-surfer").targeted_jump { "for_statement" } end,
          "Go to If Statements",
        },
        w = {
          function() require("syntax-tree-surfer").targeted_jump { "white_statement" } end,
          "Go to While Statements",
        },
        s = {
          function() require("syntax-tree-surfer").targeted_jump { "switch_statement" } end,
          "Go to Switch Statements",
        },
        t = {
          function()
            require("syntax-tree-surfer").targeted_jump {
              "function",
              "if_statement",
              "else_clause",
              "else_statement",
              "elseif_statement",
              "for_statement",
              "while_statement",
              "switch_statement",
            }
          end,
          "Go to Statement",
        },
      },
    },
  },
  i = {
    ["<c-d>"] = {
      n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
      x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
      f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
      X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
      F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
      d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
    },
  },
  v = {
    ["<leader>"] = {
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
        e = { function() require("dapui").eval() end, "Evaluate Line" },
      },
    },
  },
}
