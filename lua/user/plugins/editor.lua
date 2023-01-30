return {
  -- spread or combine code
  {
    "Wansmer/treesj",
    keys = { "<leader>J", "<leader>j" },
    cmd = {
      "TSJToggle",
      "TSJSplit",
      "TSJJoin",
    },
    init = function()
      vim.keymap.set("n", "<leader>J", function() vim.cmd [[TSJToggle]] end, { desc = "Spread: Expand" })
      vim.keymap.set("n", "<leader>j", function() vim.cmd [[TSJJoin]] end, { desc = "Spread: Combine" })
    end,
    config = true,
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
    cmd = "IncRename",
    config = true,
    keys = {
      {
        "<leader>R",
        function() return ":IncRename " .. vim.fn.expand "<cword>" end,
        { expr = true, desc = "Rename" },
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

  -- jump around
  {
    "ggandor/leap.nvim",
    init = function() table.insert(astronvim.file_plugins, "leap.nvim") end,
    dependencies = { { "tpope/vim-repeat" }, { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
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
    },
    opts = {
      highlight = {
        timer = 200,
      },
    },
  },

  -- surround text
  {
    "echasnovski/mini.surround",
    -- keys = { "gz" },
    init = function() table.insert(astronvim.file_plugins, "mini.surround") end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict with leap
      require("mini.surround").setup(opts)
    end,
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

  -- better text-objects
  {
    "echasnovski/mini.ai",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
    },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          --TODO: i did this in lazy.lua, not sure how to do it here
          -- no need to load the plugin, since we only need its queries
          -- require("lazy.core.loader").disable_rtp_plugin "nvim-treesitter-textobjects"
        end,
      },
    },
    opts = function()
      local ai = require "mini.ai"
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      local ai = require "mini.ai"
      ai.setup(opts)
    end,
  },
  -- move lines or selections in all directions
  {
    "echasnovski/mini.move",
    config = function(_, opts) require("mini.move").setup(opts) end,
    enabled = true,
    keys = {
      { "<S-h>", mode = { "n", "v" } },
      { "<S-j>", mode = { "n", "v" } },
      { "<S-k>", mode = { "n", "v" } },
      { "<S-l>", mode = { "n", "v" } },
    },
    opts = {
      mappings = {
        left = "<S-h>",
        right = "<S-j>",
        down = "<S-k>",
        up = "<S-l>",
        left_line = "<S-h>",
        right_line = "<S-j>",
        down_line = "<S-k>",
        up_line = "<S-l>",
      },
    },
  },
}
