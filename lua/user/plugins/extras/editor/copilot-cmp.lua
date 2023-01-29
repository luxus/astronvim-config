return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      return astronvim.extend_tbl(
        opts,
        { sources = cmp.config.sources {
          { name = "copilot", priority = 1002 },
        } }
      )
    end,
    dependencies = {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup {
          method = "getCompletionsCycling",
          formatters = {
            insert_text = require("copilot_cmp.format").remove_existing,
          },
        }
      end,
      dependencies = {
        {
          "onsails/lspkind.nvim",
          opts = {
            symbol_map = { Copilot = "" },
            max_width = 50,
          },
        },
        {
          "zbirenbaum/copilot.lua",
          config = true,
          opts = { panel = { enabled = false } },
        },
      },
    },
  },
}
