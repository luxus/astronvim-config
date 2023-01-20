return {
  {
    "onsails/lspkind.nvim",
    opts = {
      symbol_map = { Copilot = "" },
      max_width = 50,
    },
  },
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    dependencies = {
      {
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
            "zbirenbaum/copilot.lua",
            config = true,
            opts = { panel = { enabled = false } },
          },
        },
      },
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "jc-doyle/cmp-pandoc-references",
      -- "kdheepak/cmp-latex-symbols",
    },
    event = "InsertEnter",
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"
      local function next_item()
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
        else
          cmp.complete()
        end
      end

      return astronvim.extend_tbl(opts, {
        sources = cmp.config.sources {
          { name = "copilot", priority = 1001 },
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "pandoc_references", priority = 725 },
          -- { name = "latex_symbols", priority = 700 },
          { name = "emoji", priority = 700 },
          { name = "calc", priority = 650 },
          { name = "path", priority = 500 },
          { name = "buffer", priority = 250 },
        },

        --FIX: for copilot, that it removes the old text
        mapping = {
          ["<C-n>"] = next_item,
          ["<C-j>"] = next_item,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end,
  },
}
