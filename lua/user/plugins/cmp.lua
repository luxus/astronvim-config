return {
  {
    "onsails/lspkind.nvim",
    opts = {
      symbol_map = { Copilot = "" },
      max_width = 50,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
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
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local function next_item()
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
        else
          cmp.complete()
        end
      end
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
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

        mapping = {
          ["<C-n>"] = next_item,
          ["<C-j>"] = next_item,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
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
