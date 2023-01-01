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
    ["<leader>s"] = false,
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
    -- vim-sandwich
    ["s"] = "<Nop>",
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

--== WHICH-KEY MAPPINGS ==--
local utils = require "user.utils"
local wk = require "which-key"
wk.register({
  r = { "<cmd>SendHere<cr>", "Set REPL" },
  n = { "<cmd>enew<cr>", "New File" },
  N = { "<cmd>tabnew<cr>", "New Tab" },
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
}, { mode = "n", prefix = "<leader>" })

wk.register({
  n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
  x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
  f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
  X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
  F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
  d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
}, { mode = "i", prefix = "<c-d>" })

return mappings
