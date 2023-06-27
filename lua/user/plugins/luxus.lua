local get_icon = require("astronvim.utils").get_icon
local user = vim.env.USER
if user and user ~= "luxus" then
  return {}
else
  return {
    {
      "neo-tree.nvim",
      enabled = false,
      dependencies = {
        "miversen33/netman.nvim",
        {
          "adelarsq/image_preview.nvim",
          opts = {},
        },
      },
      opts = {
        sources = {
          "filesystem",
          "netman.ui.neo-tree",
          "git_status",
        },
        source_selector = {
          winbar = false,
          statusline = false,
          sources = {
            { source = "filesystem", display_name = get_icon "FolderClosed" .. " File" },
            { source = "remote", display_name = "󰒍 Remote" },
            { source = "git_status", display_name = get_icon "Git" .. " Git" },
          },
        },
        filesystem = {
          hijack_netrw_behavior = "open_default",
          filtered_items = {
            always_show = { ".github", ".gitignore" },
          },
        },
      },
    },
    { import = "astrocommunity.pack.nix", enabled = true },
    { import = "astrocommunity.pack.svelte", enabled = true },
    { import = "astrocommunity.pack.tailwindcss", enabled = true },
    { import = "astrocommunity.pack.rust", enabled = true },

    { import = "astrocommunity.motion.mini-ai", enabled = true },
    { import = "astrocommunity.motion.portal-nvim", enabled = true },
    { import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
    {
      "echasnovski/mini.files",
      keys = {
        {
          "<leader>e",
          function() require("mini.files").open() end,
          desc = "Explorer",
        },
      },
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      init = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniFilesBufferCreate",
          callback = function(args)
            vim.keymap.set("n", "<ESC>", function() require("mini.files").close() end, { buffer = args.buf_id })
          end,
        })
      end,
      opts = {},
    },
    { import = "astrocommunity.split-and-window.edgy-nvim", enabled = true },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function()
            -- default options: exact mode, multi window, all directions, with a backdrop
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "S",
          mode = { "n", "o", "x" },
          function() require("flash").treesitter() end,
          desc = "Flash Treesitter",
        },
        {
          "r",
          mode = "o",
          function() require("flash").remote() end,
          desc = "Remote Flash",
        },
      },
    },
    -- { import = "astrocommunity.markdown-and-latex.glow-nvim", enabled = true },
    -- { import = "astrocommunity.editing-support.nvim-regexplainer", enabled = false },

    -- { import = "astrocommunity.colorscheme.mellow-nvim", enabled = false },
    { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
    -- { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = false },
    { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
    {
      "catppuccin",
      opts = {
        -- dim_inactive = { enabled = true, percentage = 0.25 },
        transparent_background = true,
        integrations = {
          nvimtree = false,
          aerial = true,
          headlines = true,
          mason = true,
          neotree = true,
          noice = true,
          telescope = { enabled = true, style = "nvchad" },
          notify = true,
          octo = true,
          sandwich = false,
          semantic_tokens = true,
          symbols_outline = true,
          which_key = true,
          native_lsp = { enabled = true, inlay_hints = { background = false } },
          mini = true,
          leap = true,
          cmp = true,
          neotest = true,
          overseer = true,
          lsp_trouble = true,
          markdown = true,
        },
        custom_highlights = {
          -- disable italics  for treesitter highlights
          TabLineFill = { link = "StatusLine" },
          LspInlayHint = { style = { "italic" } },
          ["@parameter"] = { style = {} },
          ["@type.builtin"] = { style = {} },
          ["@namespace"] = { style = {} },
          ["@text.uri"] = { style = { "underline" } },
          ["@tag.attribute"] = { style = {} },
          ["@tag.attribute.tsx"] = { style = {} },
        },
      },
    },
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
      "TobinPalmer/rayso.nvim",
      cmd = { "Rayso" },
      keys = {},
      opts = {
        open_cmd = "safari",
      },
    },
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
    },
  }
end
