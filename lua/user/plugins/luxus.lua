local get_icon = require("astronvim.utils").get_icon
local user = vim.env.USER
if user and user ~= "luxus" then
  return {}
else
  return {
    {
      "neo-tree.nvim",
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
    {
      "folke/edgy.nvim",
      event = "VeryLazy",
      keys = {
      -- stylua: ignore
      { "<leader>ue", function() require("edgy").select() end, desc = "Edgy Select Window" },
      },
      opts = {
        animate = { enabled = false },
        bottom = {
          "Trouble",
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf) return vim.bo[buf].buftype == "help" end,
          },
          { ft = "spectre_panel", title = "Search/Replace", size = { height = 0.4 } },
        },
        left = {
          {
            title = "Files",
            ft = "neo-tree",
            filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
            size = { height = 0.5 },
          },
          {
            title = "Remote Files",
            ft = "neo-tree",
            filter = function(buf) return vim.b[buf].neo_tree_source == "remote" end,
            pinned = true,
            open = "Neotree position=top remote",
          },
          {
            title = "Git",
            ft = "neo-tree",
            filter = function(buf) return vim.b[buf].neo_tree_source == "git_status" end,
            pinned = true,
            open = "Neotree position=right git_status",
          },
          "neo-tree",
        },
        right = {
          {
            ft = "aerial",
            title = "Symbols",
            pinned = true,
            open = "AerialOpen",
          },
        },
      },
    },
    { import = "astrocommunity.pack.nix", enabled = true },
    { import = "astrocommunity.pack.svelte", enabled = true },
    { import = "astrocommunity.pack.tailwindcss", enabled = true },
    { import = "astrocommunity.pack.rust", enabled = true },
    {
      "simrat39/rust-tools.nvim",
      opts = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            -- override here. call lsp on attach and then add own custom logic.
            require("astronvim.utils.lsp").on_attach(client, bufnr)
            local rt = require "rust-tools"

            local utils = require "astronvim.utils"

            utils.set_mappings({
              n = {
                ["<leader>r"] = { name = " Rust Tools" },
                ["<leader>rr"] = { rt.hover_actions.hover_actions, desc = "Rust Hover Actions" },
                ["<leader>ra"] = { rt.code_action_group.code_action_group, desc = "Rust Code Actions" },
              },
            }, { buffer = bufnr })
          end,
        },
      },
    },
    { import = "astrocommunity.motion.mini-ai", enabled = true },
    { import = "astrocommunity.motion.portal-nvim", enabled = true },
    { import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
    { import = "astrocommunity.markdown-and-latex.glow-nvim", enabled = true },
    { import = "astrocommunity.editing-support.nvim-regexplainer", enabled = false },

    { import = "astrocommunity.colorscheme.mellow-nvim", enabled = false },
    { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
    { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = false },
    { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
    {
      "catppuccin",
      opts = {
        dim_inactive = { enabled = true, percentage = 0.25 },
        integrations = {
          nvimtree = false,
          ts_rainbow = false,
          aerial = true,
          dap = { enabled = true, enable_ui = true },
          headlines = true,
          mason = true,
          neotree = true,
          noice = true,
          notify = true,
          octo = true,
          sandwich = false,
          semantic_tokens = true,
          symbols_outline = true,
          telescope = true,
          which_key = true,
          mini = true,
          leap = true,
          cmp = true,
          neotest = true,
          overseer = true,
          lsp_trouble = true,
          ts_rainbow2 = true,
          markdown = true,
        },
        custom_highlights = function(colors)
          return {
            -- disable italics  for treesitter highlights
            TabLineFill = { link = "StatusLine" },
            ["@parameter"] = { style = {} },
            ["@type.builtin"] = { style = {} },
            ["@namespace"] = { style = {} },
            ["@text.uri"] = { style = { "underline" } },
            ["@tag.attribute"] = { style = {} },
            ["@tag.attribute.tsx"] = { style = {} },
          }
        end,
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
