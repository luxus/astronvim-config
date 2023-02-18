-- better text-objects
return {

  {
    "echasnovski/mini.ai",
    -- event = "VeryLazy",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
    },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          -- PERF: no need to load the plugin, if we only need its queries for mini.ai
          local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
          local opts = require("lazy.core.plugin").values(plugin, "opts", false)
          local enabled = false
          if opts.textobjects then
            for _, mod in ipairs { "move", "select", "swap", "lsp_interop" } do
              if opts.textobjects[mod].enable then
                enabled = true
                break
              end
            end
          end
          if not enabled then require("lazy.core.loader").disable_rtp_plugin "nvim-treesitter-textobjects" end
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
