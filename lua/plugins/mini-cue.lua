---@type LazySpec
return {
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
}
