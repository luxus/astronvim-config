local mappings = {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<leader>fh"] = false,
    ["<leader>fm"] = false,
    ["<leader>fn"] = false,
    ["<leader>fo"] = false,
    ["<leader>sb"] = false,
    ["<leader>sc"] = false,
    ["<leader>sh"] = false,
    ["<leader>sk"] = false,
    ["<leader>sm"] = false,
    ["<leader>sn"] = false,
    ["<leader>sr"] = false,
    ["q:"] = "<Nop>",
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- better search
    n = { require("user.utils").better_search "n", desc = "Next search" },
    N = { require("user.utils").better_search "N", desc = "Previous search" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- resize with arrows
    ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- Treesitter Surfer
    ["<C-down>"] = {
      function() require("syntax-tree-surfer").move("n", false) end,
      desc = "Swap next tree-sitter object",
    },
    ["<C-right>"] = {
      function() require("syntax-tree-surfer").move("n", false) end,
      desc = "Swap next tree-sitter object",
    },
    ["<C-up>"] = {
      function() require("syntax-tree-surfer").move("n", true) end,
      desc = "Swap previous tree-sitter object",
    },
    ["<C-left>"] = {
      function() require("syntax-tree-surfer").move("n", true) end,
      desc = "Swap previous tree-sitter object",
    },
  },
  i = {
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
  },
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
  },
  -- terminal mappings
  t = {
    ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- Tressitter Surfer
    ["J"] = {
      function() require("syntax-tree-surfer").surf("next", "visual") end,
      desc = "Surf next tree-sitter object",
    },
    ["K"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual") end,
      desc = "Surf previous tree-sitter object",
    },
    ["H"] = {
      function() require("syntax-tree-surfer").surf("parent", "visual") end,
      desc = "Surf parent tree-sitter object",
    },
    ["L"] = {
      function() require("syntax-tree-surfer").surf("child", "visual") end,
      desc = "Surf child tree-sitter object",
    },
    ["<C-j>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Surf next tree-sitter object",
    },
    ["<C-l>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Surf next tree-sitter object",
    },
    ["<C-k>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Surf previous tree-sitter object",
    },
    ["<C-h>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Surf previous tree-sitter object",
    },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
}

-- add more text objects for "in" and "around"
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    mappings[mode]["i" .. char] =
      { string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
    mappings[mode]["a" .. char] =
      { string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
  end
end

--== LEADER MAPPINGS ==--
local utils = require "user.utils"
astronvim.which_key_register {
  n = {
    ["<leader>"] = {
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

return mappings
