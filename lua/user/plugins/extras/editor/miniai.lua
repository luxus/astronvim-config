-- better text-objects
return {
  {
    "folke/lazy.nvim",
    opts = {
      performance = {
        rtp = {
          --TODO: dunno if this is the right way?
          disabled_plugins = {
            "nvim-treesitter-textobjects",
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    -- keys = {
    --   { "a", mode = { "x", "o" } },
    --   { "i", mode = { "x", "o" } },
    --   { "g" },
    -- },
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
        mappings = {
          -- Main textobject prefixes
          around = "a",
          inside = "i",
          around_next = "an",
          inside_next = "in",
          around_last = "al",
          inside_last = "il",
          -- Move cursor to corresponding edge of `a` textobject
          goto_left = "g[",
          goto_right = "g]",
        },
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
    config = function(_, opts) require("mini.ai").setup(opts) end,
  },
}
