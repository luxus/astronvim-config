---@type LazySpec
return {
  { "better-escape.nvim", enabled = false },
  { "LuaSnip", enabled = false },
  {
    "gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
      numhl = true,
      -- signcolumn = false,
    },
  },
  {
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
          --dismiss = false,
        },
      },
    },
  },
  {
    "echasnovski/mini.move",
    keys = {
      { "<leader>m", mode = "n", desc = "Move" },
      { "<leader>m", mode = "x", desc = "Move" },
    },
    opts = {
      mappings = {
        left = "<Leader>mh",
        right = "<Leader>ml",
        down = "<Leader>mj",
        up = "<Leader>mk",
        line_left = "<Leader>mh",
        line_right = "<Leader>ml",
        line_down = "<Leader>mj",
        line_up = "<Leader>mk",
      },
    },
  },

  -- replacing telescope with mini.pick
  -- { "telescope.nvim", enabled = false },
  -- {
  --   "echasnovski/mini.pick",
  --   opts = {},
  --   version = false,
  -- },
  -- {
  --   "AstroNvim/astrocore",
  --   ---@type AstroCoreOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         ["<leader>f"] = { desc = "Pick file" },
  --         ["<leader>ff"] = { function() require("mini.pick").builtin.files() end, desc = "Pick file" },
  --         ["<leader>fw"] = {
  --           function() require("mini.pick").builtin.grep_live() end,
  --           desc = "Pick word",
  --         },
  --         ["<tab><tab>"] = {
  --           function() require("mini.pick").builtin.buffers() end,
  --           desc = "Pick buffer",
  --         },
  --         ["<leader>fs"] = { "<cmd>Pick grep pattern='<cword>'<cr>", desc = "search in file" },
  --       },
  --     },
  --   },
  -- },
  -- replacing nvim-notify with mini.notify
  -- { "rcarriga/nvim-notify", enabled = false },
  -- {
  --   "echasnovski/mini.notify",
  --   event = "VeryLazy",
  --   config = function() vim.notify = require("mini.notify").make_notify() end,
  --   opts = {
  --     lsp_progress = {
  --       enable = false,
  --     },
  --   },
  -- },
  -- replacing which-key with mini.clue
  { "which-key.nvim", enabled = false },
  {
    "echasnovski/mini.clue",
    event = "VeryLazy",
    config = function()
      local miniclue = require "mini.clue"
      miniclue.setup {
        window = {
          delay = 100,
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },
          -- `[ & ]` key
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows {
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
          },
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
          { mode = "n", keys = "<Leader>bs", desc = "+Sort" },
          { mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
          { mode = "n", keys = "<Leader>g", desc = "+Git" },
          { mode = "n", keys = "<Leader>gn", desc = "+NeoGit" },
          { mode = "n", keys = "<Leader>S", desc = "+Sessions" },
          { mode = "n", keys = "<Leader>p", desc = "+Plugins" },
          { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
          { mode = "n", keys = "<Leader>u", desc = "+Toggle UI" },
          { mode = "n", keys = "<Leader>x", desc = "+Trouble" },
          { mode = "n", keys = "<Leader><TAB>", desc = "+TAB" },
          { mode = "n", keys = "<Leader>l", desc = "+LSP" },
          { mode = "n", keys = "]b", postkeys = "]" },
          { mode = "n", keys = "]w", postkeys = "]" },
          { mode = "n", keys = "[b", postkeys = "[" },
          { mode = "n", keys = "[w", postkeys = "[" },
          { mode = "n", keys = "]B", postkeys = "]" },
          { mode = "n", keys = "]W", postkeys = "]" },
          { mode = "n", keys = "[B", postkeys = "[" },
          { mode = "n", keys = "[W", postkeys = "[" },
          { mode = "n", keys = "<Leader>mh", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>mj", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>mk", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>ml", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mh", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mj", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mk", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>ml", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>s", desc = "+Search & Replace" },
          { mode = "n", keys = "<Leader>f", desc = "+Telescope" },
        },
      }
    end,
  },
  -- replacing nvim-tree with mini.files
  {
    "neo-tree.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>e",
        function() require("mini.files").open() end,
        desc = "Explorer",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set("n", "<ESC>", function() require("mini.files").close() end, { buffer = args.buf_id })
        end,
      })
    end,
    opts = {},
  },
}
