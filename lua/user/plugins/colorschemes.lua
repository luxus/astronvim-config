return {
  {
    "JManch/sunset.nvim",
    priority = 1000,
    dependencies = {
      -- tokyonight
      {
        "folke/tokyonight.nvim",
        opts = { style = "moon" },
      },
      -- { "ray-x/starry.nvim" },
      {
        "echasnovski/mini.base16",
      },

      -- catppuccin
      -- {
      --   "catppuccin/nvim",
      --   name = "catppuccin",
      --
      -- },

      -- {
      --   "EdenEast/nightfox.nvim",
      --   opts = {
      --     options = {
      --       dim_inactive = true,
      --       styles = { comments = "italic" },
      --       module_default = false,
      --       modules = {
      --         aerial = true,
      --         cmp = true,
      --         ["dap-ui"] = true,
      --         diagnostic = true,
      --         gitsigns = true,
      --         hop = true,
      --         native_lsp = true,
      --         neotree = true,
      --         notify = true,
      --         telescope = true,
      --         treesitter = true,
      --         tsrainbow = true,
      --         noice = true,
      --         whichkey = true,
      --       },
      --     },
      --     groups = { all = { NormalFloat = { link = "Normal" } } },
      --   },
      -- },
    },
    event = "VimEnter",
    config = function()
      require("sunset").setup {
        latitude = 48.57,
        longitude = 8.51,
        day_callback = function() vim.cmd "colorscheme tokyonight-day" end,
        night_callback = function() vim.cmd "colorscheme tokyonight" end,
        -- night_callback = function() vim.cmd "colorscheme middlenight_blue" end,
      }
    end,
  },
}
