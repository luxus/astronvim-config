function GUI() return vim.g.neovide and false or true end
return {
  -- { "luxus/astroluxus", dev = true }, -- loading my plugins
  { "AstroNvim/astrocommunity" }, -- loading community plugins
  -- colorschemes
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  {
    "catppuccin",
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        headlines = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    opts = {},
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = { "WinNew" },
    opts = {},
  },
  {
    "luxus/carbonclone.nvim", -- oxicarbon edition :D
    config = function()
      vim.g.carbonclone_h = 50
      vim.g.carbonclone_s = 10
      vim.g.carbonclone_l = 20
      vim.g.carbonclone_contrast = 100

      vim.g.carbonclone_fg = "#ffffff"
      vim.g.carbonclone_bg = "#161616"

      vim.g.carbonclone_constant = "#ff7eb6"
      vim.g.carbonclone_identifier = "#dde1e6"
      vim.g.carbonclone_statement = "#3dddb9"
      vim.g.carbonclone_error = "#ee5396"
      vim.g.carbonclone_warning = "#82cfff"
      vim.g.carbonclone_success = "#be95ff"
      vim.g.carbonclone_info = "#f2f4f8"
    end,
    dependencies = "rktjmp/lush.nvim",
  },
  { import = "astrocommunity.colorscheme.everforest", enabled = true },
  { import = "astrocommunity.colorscheme.gruvbox", enabled = true },
  { import = "astrocommunity.colorscheme.nightfox", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa", enabled = false },
  { import = "astrocommunity.colorscheme.oxocarbon", enabled = false },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
  { import = "astrocommunity.colorscheme.onigiri", enabled = false },
  { import = "astrocommunity.colorscheme.tokyonight", enabled = true },
  { "tokyonight.nvim", opts = { style = "night", light_style = "storm" } },
  { import = "astrocommunity.colorscheme.mini-base16", enabled = false },
  { import = "astrocommunity.utility.neodim", enabled = true },
  { import = "astrocommunity.completion.copilot-lua", enabled = true },
  {
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
          --dismiss = false,
        },
      },
    },
  },
  { import = "astrocommunity.completion.copilot-cmp", enabled = false },
  {
    "luxus/colorful-times-nvim",
    lazy = false,
    dev = false,
    keys = {
      { "<leader>uT", function() require("colorful-times-nvim").toggle() end, desc = "Toggle Themeswitch" },
    },
    opts = {
      default = {
        theme = "everforest", -- the default theme to use if no timeframes match
        bg = "dark", -- the default background to use
      },
      timeframes = { -- the timeframes to use
        { theme = "rose-pine", start = "19:36", stop = "20:10" },
        { theme = "everforest", start = "20:10", stop = "16:44" },
        { theme = "tokyonight", start = "16:45", stop = "19:35", bg = "dark" },
      },
    },
  },
  {
    "gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },
  { import = "astrocommunity.pack.go", enabled = false },
  { import = "astrocommunity.pack.nix", enabled = true },
  { import = "astrocommunity.pack.rust", enabled = true },
  { import = "astrocommunity.pack.typescript", enabled = true },
  { import = "astrocommunity.pack.python", enabled = false },
  { import = "astrocommunity.pack.lua", enabled = true },
  { import = "astrocommunity.pack.bash", enabled = true },
  { import = "astrocommunity.pack.svelte", enabled = true },
  { import = "astrocommunity.pack.yaml", enabled = true },
  { import = "astrocommunity.pack.markdown", enabled = true },
  { import = "astrocommunity.pack.php", enabled = false },
  { import = "astrocommunity.pack.json", enabled = true },

  { import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
  { import = "astrocommunity.indent.mini-indentscope", enabled = true },

  { import = "astrocommunity.media.pets-nvim", enabled = false },
  { import = "astrocommunity.media.presence-nvim", enabled = true },
  { import = "astrocommunity.media.vim-wakatime", enabled = true },
  { import = "astrocommunity.scrolling.mini-animate", enabled = GUI() },
  { import = "astrocommunity.scrolling.satellite-nvim", enabled = true },
  { import = "astrocommunity.color.tint-nvim", enabled = true },
  { import = "astrocommunity.media.drop-nvim", enabled = GUI() },
  { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },
  { import = "astrocommunity.test.neotest", enabled = false },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim", enabled = true },
  -- {
  --   "lsp_lines.nvim",
  --   --FIXME: virtual_text didn't work here.. it gets reanabled somewhere else
  --   init = function() vim.diagnostic.config { virtual_lines = false } end,
  --   keys = { { "<leader>v", "<cmd>lua require('lsp_lines').toggle()<CR>", desc = "Toggle LSP Lines" } },
  -- },
  { import = "astrocommunity.project.neoconf-nvim", enabled = true },
  { import = "astrocommunity.project.nvim-spectre", enabled = true },
  { import = "astrocommunity.color.ccc-nvim", enabled = false },
  { import = "astrocommunity.motion.portal-nvim", enabled = true },
  {
    "cbochs/portal.nvim",
    dependencies = {
      "cbochs/grapple.nvim",
      enabled = true,
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<leader> ", function() require("grapple").popup_tags() end, desc = "Grapple" },
        { "<leader>A", function() require("grapple").toggle() end, desc = "Tag in Grapple" },
        { "<leader>1", function() require("grapple").select { key = 1 } end, desc = "Grapple 1" },
        { "<leader>2", function() require("grapple").select { key = 2 } end, desc = "Grapple 2" },
        { "<leader>3", function() require("grapple").select { key = 3 } end, desc = "Grapple 3" },
        { "<leader>4", function() require("grapple").select { key = 4 } end, desc = "Grapple 4" },
      },
    },
  },
  { import = "astrocommunity.motion.mini-ai", enabled = true },
  { import = "astrocommunity.motion.vim-matchup", enabled = true },
  { import = "astrocommunity.motion.mini-move", enabled = true },
  { import = "astrocommunity.motion.mini-surround", enabled = true },
  { import = "astrocommunity.motion.mini-bracketed", enabled = true },
  { import = "astrocommunity.motion.leap-nvim", enabled = true },
  { import = "astrocommunity.utility.noice-nvim", enabled = GUI() },
  {
    "noice.nvim",
    opts = {
      messages = { enabled = true },
      cmdline = {
        format = {
          filter = { pattern = "^:%s*!", icon = "$ ", ft = "sh" },
          IncRename = {
            pattern = "^:%s*IncRename%s+",
            icon = " ",
            conceal = true,
          },
        },
      },
      views = {
        cmdline_popup = {
          border = { style = "none", padding = { 1, 2 } },
          win_options = {
            winblend = 5,
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "NoiceCmdlinePopupBorder",
              IncSearch = "",
              Search = "",
            },
            cursorline = false,
          },
        },
      },
      popupmenu = {
        enabled = true,
      },
      routes = {
        { view = "notify", filter = { event = "msg_showmode" } },
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, view = "mini" },
        {
          view = "cmdline_output",
          filter = { cmdline = "^:", min_height = 5 },
          -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
        },
        { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; before #" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; after #" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = " lines, " }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "go up one level" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "yanked" }, opts = { skip = true } },
        { filter = { find = "No active Snippet" }, opts = { skip = true } },
        { filter = { find = "waiting for cargo metadata" }, opts = { skip = true } },
      },
      presets = {
        inc_rename = true,
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = "rounded",
      },
    },
  },
  { import = "astrocommunity.editing-support.refactoring-nvim", enabled = false },
  { import = "astrocommunity.editing-support.zen-mode-nvim", enabled = true },
  { import = "astrocommunity.editing-support.dial-nvim", enabled = true },
  { import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
  { import = "astrocommunity.editing-support.neogen", enabled = false },
  { import = "astrocommunity.editing-support.nvim-regexplainer", enabled = true },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2", enabled = true },
  { import = "astrocommunity.comment.mini-comment", enabled = true },
  { import = "astrocommunity.bars-and-lines.scope-nvim", enabled = false },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim", enabled = true },
  { "smartcolumn.nvim", opts = { colorcolumn = 120, disabled_filetypes = { "help" } } },
  { import = "astrocommunity.code-runner.overseer-nvim", enabled = true },
  { import = "astrocommunity.markdown-and-latex.glow", enabled = false },
  { import = "astrocommunity.terminal-integration.flatten-nvim", enabled = true },
  { import = "astrocommunity.syntax.hlargs-nvim", enabled = true },
  { import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
  {
    "b0o/incline.nvim",
    event = "User AstroFile",
    opts = { hide = { focused_win = true } },
  },
  {
    "smjonas/inc-rename.nvim",
    opts = {},
    keys = {
      {
        "<leader>sr",
        function()
          require "inc_rename"
          return ":IncRename " .. vim.fn.expand "<cword>"
        end,
        expr = true,
        desc = "Inc Rename",
      },
    },
  },
  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach", config = true },

  {
    "todo-comments.nvim",
    keys = {
      -- { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      -- { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "User AstroFile",
    opts = {
      -- config
    },
  },
}
