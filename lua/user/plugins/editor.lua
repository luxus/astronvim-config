return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", version = false, branch = "main" }, -- use mainline neo-tree for testing new fix
  -- disable some stuff
  { "numToStr/Comment.nvim", enabled = false },
  -- { "windwp/nvim-autopairs", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
  { "machakann/vim-sandwich", enabled = false },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-q>", mode = { "t" }, "<C-\\><C-n>", desc = "Terminal normal mode" },
      { "<esc><esc>", mode = { "t" }, "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
    opts = { terminal_mappings = false },
  },
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
  { "folke/which-key.nvim", opts = { window = { border = "none" } } },
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
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
    keys = {
      {
        "<leader>R",
        "<cmd>IncRename<cr>",
        desc = "Rename",
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
  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },
  {
    "ggandor/leap.nvim",
    init = function() table.insert(astronvim.file_plugins, "leap.nvim") end,
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
  },
  -- harpooon inspired
  {
    "cbochs/grapple.nvim",
    lazy = true,
    enabled = true,
    module = "grapple",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader> ", function() require("grapple").popup_tags() end, desc = "Grapple" },
      { "<leader>A", function() require("grapple").toggle() end, desc = "Tag in Grapple" },
      { "<leader>1", function() require("grapple").select { key = 1 } end, desc = "Grapple 1" },
      { "<leader>2", function() require("grapple").select { key = 2 } end, desc = "Grapple 2" },
      { "<leader>3", function() require("grapple").select { key = 3 } end, desc = "Grapple 3" },
      { "<leader>4", function() require("grapple").select { key = 4 } end, desc = "Grapple 4" },
    },
  },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    enabled = false,
    event = "VeryLazy",
    config = function(_, opts) require("mini.pairs").setup(opts) end,
  },

  -- surround text
  {
    "echasnovski/mini.surround",
    keys = { "gz" },
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
  -- Neogen is a better annotation generator.
  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "ldoc" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
    config = function()
      require("which-key").register {
        ["<leader>a"] = { name = "+Annotation" },
      }
    end,

    keys = {
      {
        "<leader>a<cr>",
        function() require("neogen").generate { type = "current" } end,
        desc = "Current",
      },
      { "<leader>ac", function() require("neogen").generate { type = "class" } end, desc = "Class" },
      { "<leader>af", function() require("neogen").generate { type = "func" } end, desc = "Function" },
      { "<leader>at", function() require("neogen").generate { type = "type" } end, desc = "Type" },
      { "<leader>aF", function() require("neogen").generate { type = "file" } end, desc = "File" },
    },
  },
  -- Looks like oil does support ssh without netman
  -- { "miversen33/netman.nvim" },
  -- navigate splits including tmux and wezterm
  -- TODO: maybe use it again when it supports splits.
  {
    "numToStr/Navigator.nvim",
    config = true,
    enabled = false,
    event = "VeryLazy",
    keys = {
      { "<C-h>", mode = { "n", "t" }, "<CMD>NavigatorLeft<CR>", desc = "Navigate Left" },
      { "<C-l>", mode = { "n", "t" }, "<CMD>NavigatorRight<CR>", desc = "Navigate Right" },
      { "<C-k>", mode = { "n", "t" }, "<CMD>NavigatorUp<CR>", desc = "Navigate Up" },
      { "<C-j>", mode = { "n", "t" }, "<CMD>NavigatorDown<CR>", desc = "Navigate Down" },
      { "<C-P>", mode = { "n", "t" }, "<CMD>NavigatorPrevious<CR>", desc = "Navigate Previous" },
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
    event = "VeryLazy",
    enabled = true,
  },
  { "stevearc/oil.nvim", config = true, enabled = true, event = "VeryLazy" },
  { "folke/todo-comments.nvim", event = "BufRead", config = true },
  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function() require("ts_context_commentstring.internal").update_commentstring {} end,
      },
    },
    config = function(_, opts) require("mini.comment").setup(opts) end,
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
          -- no need to load the plugin, since we only need its queri es
          require("lazy.core.loader").disable_rtp_plugin "nvim-treesitter-textobjects"
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
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    config = function(_, opts) require("mini.move").setup(opts) end,
    -- Module mappings. Use `''` (empty string) to disable one.
    -- mappings = {
    --   -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    --   left = "<M-h>",
    --   right = "<M-l>",
    --   down = "<M-j>",
    --   up = "<M-k>",
    --
    --   -- Move current line in Normal mode
    --   line_left = "<M-h>",
    --   line_right = "<M-l>",
    --   line_down = "<M-j>",
    --   line_up = "<M-k>",
    -- },
  },
  {
    "echasnovski/mini.indentscope",
    -- version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },
  -- still not using quickfix 😆
  -- https://github.com/kevinhwang91/nvim-bqf
  { "kevinhwang91/nvim-bqf", event = "BufReadPost", config = true },
  -- don't use it yet
  -- https://github.com/ThePrimeagen/refactoring.nvim
  { "ThePrimeagen/refactoring.nvim", event = "BufRead", config = true },
  -- https://github.com/AckslD/nvim-neoclip.lua
  -- yank history
  { "AckslD/nvim-neoclip.lua", event = "BufRead", config = true },
  {
    "uga-rosa/ccc.nvim",
    -- event = "BufRead",
    lazy = true,
    init = function() table.insert(astronvim.file_plugins, "ccc.nvim") end,
    config = function() require("ccc").setup { highlighter = { auto_enable = true } } end,
    keys = { { "<leader>C", "<cmd>CccPick<cr>", desc = "Toggle colorizer" } },
  },
}
