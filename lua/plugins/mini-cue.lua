---@type LazySpec
return {
  -- replacing which-key with mini.clue
  { "which-key.nvim", enabled = false },
  {
    "echasnovski/mini.clue",
    keys = {
      "<Leader>",
    },
    dependecies = { "AstroNvim/astrocore" },
    opts = function()
      local miniclue = require "mini.clue"
      local astrocore_clues = {}
      for mode, maps in pairs(require("astrocore").which_key_queue) do
        for keys, map in pairs(maps) do
          if type(map) == "table" then
            local desc = map.name or map.desc
            if desc then table.insert(astrocore_clues, { mode = mode, keys = keys, desc = desc }) end
          end
        end
      end
      return {
        window = {
          delay = 100,
          config = { anchor = "SW", row = "auto", col = "auto", border = "none" },
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

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
          { mode = "x", keys = "<Leader>m" },
          { mode = "n", keys = "<Leader>m" },
        },
        clues = {
          astrocore_clues,
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows {
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
          },
          require("astrocore").which_key_register(),
          miniclue.gen_clues.z(),
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
          { mode = "x", keys = "<Leader>ml", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mk", postkeys = "<Leader>m" },
        },
      }
    end,
  },
}
