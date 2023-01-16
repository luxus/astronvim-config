local utils = require "user.utils"
local mappings = {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["q:"] = ":",
    -- better buffer navigation
    ["]b"] = false,
    ["[b"] = false,

    ["<S-l>"] = {
      function() astronvim.nav_buf(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() astronvim.nav_buf(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<CR>"] = { function() astronvim.ui.toggle_tabline() end, desc = "Toggle tabline" },
    -- open buffers
    ["<tab>"] = {
      "<cmd>lua require('telescope.builtin').buffers({previewer = false, initial_mode='normal'})<cr>",
    },
    ["<leader>R"] = { ":IncRename ", desc = "Rename" },
    ["<leader>v"] = { "<cmd>lua require('lsp_lines').toggle()<CR>", desc = "識LSP Lines" },
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
    ["<Up>"] = {
      function() require("smart-splits").resize_up(2) end,
      desc = "Resize split up",
    },
    ["<Down>"] = {
      function() require("smart-splits").resize_down(2) end,
      desc = "Resize split down",
    },
    ["<Left>"] = {
      function() require("smart-splits").resize_left(2) end,
      desc = "Resize split left",
    },
    ["<Right>"] = {
      function() require("smart-splits").resize_right(2) end,
      desc = "Resize split right",
    },
    --FIX: looks like there is no "has"
    -- ["gK"] = { vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" } },

    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    ["<leader> "] = {
      function() require("grapple").popup_tags() end,
      desc = "Grapple",
    },
    ["<leader>A"] = {
      function() require("grapple").toggle() end,
      desc = "Tag in Grapple",
    },
    ["<leader>1"] = {
      function() require("grapple").select { key = 1 } end,
      desc = "Grapple 1",
    },
    ["<leader>2"] = {
      function() require("grapple").select { key = 2 } end,
      desc = "Grapple 2",
    },
    ["<leader>3"] = {
      function() require("grapple").select { key = 3 } end,
      desc = "Grapple 3",
    },
    ["<leader>4"] = {
      function() require("grapple").select { key = 4 } end,
      desc = "Grapple 4",
    },

    ["<leader>r"] = { "<cmd>SendHere<cr>", desc = "Set REPL" },
    ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    -- neogen
    ["<leader>a"] = { name = "Annotate" },
    ["<leader>a<cr>"] = {
      function() require("neogen").generate { type = "current" } end,
      desc = "Current",
    },
    ["<leader>ac"] = {
      function() require("neogen").generate { type = "class" } end,
      desc = "Class",
    },
    ["<leader>af"] = {
      function() require("neogen").generate { type = "func" } end,
      desc = "Function",
    },
    ["<leader>at"] = {
      function() require("neogen").generate { type = "type" } end,
      desc = "Type",
    },
    ["<leader>aF"] = {
      function() require("neogen").generate { type = "file" } end,
      desc = "File",
    },
    -- telescope plugin mappings
    ["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    ["<leader>fM"] = { "<cmd>Telescope media_files<cr>", desc = "Find media" },
    ["<leader>fp"] = { "<cmd>Telescope project<cr>", desc = "Find projects" },
    -- compiler
    ["<leader>m"] = { name = "Compiler" },
    ["<leader>mk"] = {
      function()
        vim.cmd "silent! write"
        local filename = vim.fn.expand "%:t"
        utils.async_run(
          { "compiler", vim.fn.expand "%:p" },
          function() utils.quick_notification("Compiled " .. filename) end
        )
      end,
      desc = "Compile",
    },
    ["<leader>ma"] = {
      function()
        vim.notify "Autocompile Started"
        utils.async_run(
          { "autocomp", vim.fn.expand "%:p" },
          function() utils.quick_notification "Autocompile stopped" end
        )
      end,
      desc = "Auto Compile",
    },
    ["<leader>mv"] = {
      function() vim.fn.jobstart { "opout", vim.fn.expand "%:p" } end,
      desc = "View Output",
    },
    ["<leader>mb"] = {
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
      desc = "Compile Beamer",
    },
    ["<leader>mp"] = {
      function()
        local pdf_path = vim.fn.expand "%:r" .. ".pdf"
        if vim.fn.filereadable(pdf_path) == 1 then vim.fn.jobstart { "pdfpc", pdf_path } end
      end,
      desc = "Present Output",
    },
    ["<leader>ml"] = {
      function() utils.toggle_qf() end,
      desc = "Logs",
    },
    ["<leader>mt"] = { "<cmd>TexlabBuild<cr>", desc = "LaTeX" },
    ["<leader>mf"] = { "<cmd>TexlabForward<cr>", desc = "Forward Search" },
    ["<leader>fu"] = { "<cmd>Telescope undo<cr>", desc = "Undo" },
    ["<leader>fz"] = { "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
    ["<C-h>"] = { "<CMD>NavigatorLeft<CR>", desc = "Navigate Left" },
    ["<C-l>"] = { "<CMD>NavigatorRight<CR>", desc = "Navigate Right" },
    ["<C-k>"] = { "<CMD>NavigatorUp<CR>", desc = "Navigate Up" },
    ["<C-j>"] = { "<CMD>NavigatorDown<CR>", desc = "Navigate Down" },
    ["<C-P>"] = { "<CMD>NavigatorPrevious<CR>", desc = "Navigate Previous" },
  },
  i = {
    -- ["<c-k>"] = { vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" } },
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
    -- date/time input
    ["<c-d>"] = { name = "Date/Time" },
    ["<c-d>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
    ["<c-d>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
    ["<c-d>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
    ["<c-d>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
    ["<c-d>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
    ["<c-d>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
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
    -- -- line text-objects
    -- ["il"] = { "g_o^", desc = "Inside line text object" },
    -- ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
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

return mappings
