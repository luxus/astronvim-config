return {
  {
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    cmd = {
      "TroubleToggle",
      "Trouble",
    },
    dependencies = {
      { "AstroNvim/astroui", opts = {
        icons = {
          Trouble = "󱍼",
        },
      } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>x"
          maps.n[prefix] = { desc = require("astroui").get_icon("Trouble", 1, true) .. "Trouble" }
          maps.n[prefix .. "X"] =
            { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" }
          maps.n[prefix .. "x"] = { "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" }
          maps.n["lx"] = {
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
          }
          maps.n["lX"] = { "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" }
          maps.n[prefix .. "l"] = { "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" }
          maps.n[prefix .. "q"] = { "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" }
        end,
      },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<ESC>" },
        cancel = "<C-e>",
      },
    },
  },
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.bottom then opts.bottom = {} end
      table.insert(opts.bottom, "Trouble")
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { lsp_trouble = true } },
  },
}
