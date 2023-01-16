return {
  {
    "JManch/sunset.nvim",
    dependencies = {
      -- tokyonight
      {
        "folke/tokyonight.nvim",
        opts = { style = "moon" },
      },

      -- catppuccin
      {
        "catppuccin/nvim",
        name = "catppuccin",
      },

      {
        "EdenEast/nightfox.nvim",
        opts = {
          options = {
            dim_inactive = true,
            styles = { comments = "italic" },
            module_default = false,
            modules = {
              aerial = true,
              cmp = true,
              ["dap-ui"] = true,
              diagnostic = true,
              gitsigns = true,
              hop = true,
              native_lsp = true,
              neotree = true,
              notify = true,
              telescope = true,
              treesitter = true,
              tsrainbow = true,
              noice = true,
              whichkey = true,
            },
          },
          groups = { all = { NormalFloat = { link = "Normal" } } },
        },
      },
    },
    event = "VimEnter",
    config = function()
      require("sunset").setup {
        latitude = 48.57417172487304,
        longitude = 8.519202729579861,
        day_callback = function() vim.cmd "colorscheme dayfox" end,
        -- night_callback = function() vim.cmd "colorscheme tokyonight-moon" end,
        night_callback = function() vim.cmd "colorscheme nightfox" end,
      }
    end,
  },
}
