local user = vim.env.USER
if user and user ~= "luxus" then
  return {}
else
  return {
    { import = "astrocommunity.pack.nix", enabled = true },
    { import = "astrocommunity.pack.svelte", enabled = true },
    { import = "astrocommunity.pack.tailwindcss", enabled = true },
    { import = "astrocommunity.motion.mini-ai", enabled = true },
    { import = "astrocommunity.motion.portal-nvim", enabled = true },
    { import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
    { import = "astrocommunity.markdown-and-latex.glow-nvim", enabled = true },
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim", enabled = true },
    { import = "astrocommunity.editing-support.nvim-regexplainer", enabled = true },
    {
      "portal.nvim",
      dependencies = {
        "cbochs/grapple.nvim",
        enabled = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
          { "<leader> ", function() require("grapple").popup_tags() end, desc = "Grapple" },
          { "<leader>a", function() require("grapple").toggle() end, desc = "Tag in Grapple" },
          { "<leader>1", function() require("grapple").select { key = 1 } end, desc = "Grapple 1" },
          { "<leader>2", function() require("grapple").select { key = 2 } end, desc = "Grapple 2" },
          { "<leader>3", function() require("grapple").select { key = 3 } end, desc = "Grapple 3" },
          { "<leader>4", function() require("grapple").select { key = 4 } end, desc = "Grapple 4" },
        },
      },
    },
    {
      "lukas-reineke/headlines.nvim",
      dependencies = "nvim-treesitter/nvim-treesitter",
      ft = "markdown",
      opts = {
        markdown = {
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          quote_highlight = "Quote",
        },
      },
    },
    { "mrjones2014/op.nvim", build = "make install", opts = {}, cmd = { "OpSidebar", "OpSignin", "OpNote" } },
    -- { "HampusHauffman/bionic.nvim", cmd = "Bionic" },
    {
      "luxus/colorful-times-nvim",
      lazy = false,
      dev = true,
      keys = {
        { "<leader>uT", function() require("colorful-times-nvim").toggle() end, desc = "Toggle Themeswitch" },
      },
      opts = {
        default = {
          theme = "rose-pine", -- the default theme to use if no timeframes match
          bg = "dark", -- the default background to use
        },
        timeframes = { -- the timeframes to use
          --  { theme = "astrolight", start = "06:30", stop = "16:00" },
          { theme = "catppuccin-latte", start = "08:30", stop = "17:00", bg = "light" },
          { theme = "catppuccin-mocha", start = "19:00", stop = "21:00" },
        },
      },
    },
    { "Fildo7525/pretty_hover", opts = {}, event = "LspAttach" },
    {
      "b0o/incline.nvim",
      event = "User AstroFile",
      opts = { hide = { focused_win = true } },
    }, -- {
    --   "neo-tree.nvim",
    --   dependencies = {
    --     {
    --       "adelarsq/image_preview.nvim",
    --       opts = {},
    --     },
    --   },
    -- },
  }
end
