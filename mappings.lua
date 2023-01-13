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
    ["<S-l>"] = { function() astronvim.nav_buf(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-h>"] = { function() astronvim.nav_buf(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
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
    -- vim-sandwich
    ["s"] = "<Nop>",
    ["<leader>r"] = { "<cmd>SendHere<cr>", desc = "Set REPL" },
    ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    -- neogen
    ["<leader>a"] = { name = "Annotate" },
    ["<leader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
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
    ["<leader>mv"] = { function() vim.fn.jobstart { "opout", vim.fn.expand "%:p" } end, desc = "View Output" },
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
    ["<leader>ml"] = { function() utils.toggle_qf() end, desc = "Logs" },
    ["<leader>mt"] = { "<cmd>TexlabBuild<cr>", desc = "LaTeX" },
    ["<leader>mf"] = { "<cmd>TexlabForward<cr>", desc = "Forward Search" },
  },
  i = {
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
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- vim-sandwich
    ["s"] = "<Nop>",
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
