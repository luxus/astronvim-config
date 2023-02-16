return {
  -- spread or combine code
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
      use_default_keymaps = false,
    },
  },

  --Jumping between the idents
  {
    "arsham/indent-tools.nvim",
    dependencies = { "arsham/arshlib.nvim" },
    init = function() table.insert(astronvim.file_plugins, "indent-tools.nvim") end,
    config = function() require("indent-tools").config {} end,
  },
  -- remember the last place
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },
  --visually rename functions
  {
    "smjonas/inc-rename.nvim",
    config = true,
    keys = {
      {
        "<leader>sr",
        function() return ":IncRename " .. vim.fn.expand "<cword>" end,
        desc = "Inc Rename",
      },
    },
  },
  -- better increase/descrease
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require "dial.augend"
      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      }
    end,
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
  },

  -- yanky more options for put
  {
    "gbprod/yanky.nvim",
    config = true,
    keys = {
      { "p", mode = { "n", "x" }, "<Plug>(YankyPutAfter)", desc = "Put after" },
      { "P", mode = { "n", "x" }, "<Plug>(YankyPutBefore)", desc = "Put before" },
      { "gp", mode = { "n", "x" }, "<Plug>(YankyGPutAfter)", desc = "GPut after" },
      { "gP", mode = { "n", "x" }, "<Plug>(YankyGPutBefore)", desc = "GPut before" },
      { "<c-n>", mode = { "n", "x" }, "<Plug>(YankyCycleForward)", desc = "Yank Cycle Forward" },
      { "<c-p>", mode = { "n", "x" }, "<Plug>(YankyCycleBackward)", desc = "Yank Cycle Backward" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indent After Linewise" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indent Before Linewise" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indent After Linewise" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indent Before Linewise" },

      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put Indent After Shift Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put Indent After Shift Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Indent Before Shift Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Indent Before Shift Left" },

      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Filter" },
    },
    opts = {
      highlight = {
        timer = 200,
      },
    },
  },

  -- framework for interactive tests
  {
    "nvim-neotest/neotest",
    -- config = true,
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },

  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach", config = true },
  {
    "junegunn/vim-easy-align",
    init = function() table.insert(astronvim.file_plugins, "vim-easy-align") end,
    keys = {
      { "ga", mode = { "x" }, "<Plug>(EasyAlign)", desc = "Easy Align" },
    },
  },

  {
    "m-demare/hlargs.nvim",
    config = true,
    init = function() table.insert(astronvim.file_plugins, "hlargs.nvim") end,
    enabled = true,
  },
  -- make todo, fix etc stand out
  {
    "folke/todo-comments.nvim",
    config = true,
    init = function() table.insert(astronvim.file_plugins, "todo-comments.nvim") end,
  },
}
