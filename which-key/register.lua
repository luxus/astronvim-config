local utils = require "user.utils"

return {
  n = {
    ["<leader>"] = {
      b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
      r = { "<cmd>SendHere<cr>", "Set REPL" },
      N = { "<cmd>tabnew<cr>", "New Buffer" },
      ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
      ["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },

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

      s = {
        name = "Surf",
        s = { function() require("syntax-tree-surfer").select() end, "Surf" },
        S = { function() require("syntax-tree-surfer").select_current_node() end, "Surf Node" },
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
}
