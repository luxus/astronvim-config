return {
  {
    "augmentcode/augment.vim",
    lazy = false,
    specs = {
      { import = "astrocommunity.recipes.ai" },
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              augment_workspace_folders = { "/Users/luxus/projects/DrForge" },
              augment_disable_tab_mapping = true,
              -- -- set the ai_accept function
              -- ai_accept = function()
              --
              -- end,
            },
          },
        },
      },
    },

    {

      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        options = {
          g = { -- vim.g.<key>
            augment_workspace_folders = { "/Users/luxus/projects/DrForge" },
            augment_disable_tab_mapping = true,
          },
        },
        mappings = {
          n = {
            ["<Leader>aa"] = { "<cmd>Augment chat-toggle<cr>", desc = "Augment Chat" },
            ["<Leader>aA"] = { "<cmd>Augment chat-new<cr>", desc = "Augment New Chat" },
          },
          i = {
            ["<C-l>"] = { "<cmd>call augment#Accept()<cr>", desc = "Augment accept" },
          },
          v = {
            ["<Leader>aa"] = { "<cmd>Augment chat-toggle<cr>", desc = "Augment Chat" },
            ["<Leader>aA"] = { "<cmd>Augment chat-new<cr>", desc = "Augment New Chat" },
          },
        },
      },
    },
  },
}
