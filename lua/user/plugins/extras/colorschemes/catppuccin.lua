return {
  { "AstroNvim/astrotheme", enabled = false },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      local hour = tonumber(os.date "%H")
      local flavour = hour >= 6 and hour <= 18 and "frappe" or "mocha"
      vim.cmd("colorscheme catppuccin-" .. flavour)
    end,
    opts = {
      dim_inactive = { enabled = true, percentage = 0.25 },
      integrations = {
        nvimtree = false,
        ts_rainbow = false,
        aerial = true,
        dap = { enabled = true, enable_ui = true },
        mason = true,
        neotree = true,
        notify = true,
        sandwich = true,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        native_lsp = true,
        overseer = true,
        lsp_trouble = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        ts_rainbow2 = true,
        which_key = true,
      },
    },
    priority = 1000,
    lazy = false,
  },
}
