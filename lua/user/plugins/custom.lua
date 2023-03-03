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
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
    },
  },
  { import = "astrocommunity.motion.mini-bracketed", enabled = true },
  { import = "astrocommunity.motion.mini-basics", enabled = true },
  { import = "astrocommunity.colorscheme.everforest", enabled = false },
  { import = "astrocommunity.colorscheme.nightfox", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa", enabled = true },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
  { import = "astrocommunity.colorscheme.onigiri", enabled = false },
  { import = "astrocommunity.colorscheme.tokyonight", enabled = true },
  { import = "astrocommunity.colorscheme.mini-base16", enabled = false },
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

  { import = "astrocommunity.pack.go", enabled = false },
  { import = "astrocommunity.pack.nix", enabled = true },
  { import = "astrocommunity.pack.rust", enabled = true },
  { import = "astrocommunity.pack.typescript", enabled = false },
  { import = "astrocommunity.pack.python", enabled = false },

  { import = "astrocommunity.media.pets-nvim", enabled = false },
  { import = "astrocommunity.media.presence-nvim", enabled = false },
  { import = "astrocommunity.media.vim-wakatime", enabled = true },
  { import = "astrocommunity.scrolling.mini-animate", enabled = GUI() },
  {
    "mini.basics",
    opts = {
      options = {
        -- Basic options ('termguicolors', 'number', 'ignorecase', and many more)
        basic = true,
        -- Extra UI features ('winblend', 'cmdheight=0', ...)
        extra_ui = true,
      },
    },
  },
  { import = "astrocommunity.scrolling.satellite-nvim", enabled = true },
  { import = "astrocommunity.color.tint-nvim", enabled = true },
  { import = "astrocommunity.media.drop-nvim", enabled = GUI() },
  { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim", enabled = true },
  {
    "lsp_lines.nvim",
    init = function() vim.diagnostic.config { virtual_text = false, virtual_lines = false } end,
    keys = { { "<leader>v", "<cmd>lua require('lsp_lines').toggle()<CR>", desc = "Toggle LSP Lines" } },
  },
  { import = "astrocommunity.project.neoconf-nvim", enabled = true },
  { import = "astrocommunity.project.nvim-spectre", enabled = true },
  { import = "astrocommunity.color.ccc-nvim", enabled = false },
  { import = "astrocommunity.motion.portal-nvim", enabled = true },
  { import = "astrocommunity.motion.mini-move", enabled = true },
  { import = "astrocommunity.utility.noice-nvim", enabled = GUI() },
  {
    "noice.nvim",
    opts = {
      messages = { enabled = true },
      cmdline = {
        format = {
          filter = { pattern = "^:%s*!", icon = " ", ft = "sh" },
          IncRename = {
            pattern = "^:%s*IncRename%s+",
            icon = " ",
            conceal = true,
            opts = {
              -- relative = "cursor",
              -- size = { min_width = 20 },
              -- position = { row = -3, col = 0 },
              buf_options = { filetype = "text" },
            },
          },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
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
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
          view = "mini",
        },
        {
          view = "cmdline_output",
          filter = { cmdline = "^:", min_height = 5 },
          -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
        },
        {
          filter = { event = "msg_show", kind = "search_count" },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "; before #",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "; after #",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = " lines, ",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "go up one level",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "yanked",
          },
          opts = { skip = true },
        },
        {
          filter = { find = "No active Snippet" },
          opts = { skip = true },
        },
        {
          filter = { find = "waiting for cargo metadata" },
          opts = { skip = true },
        },
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
  { import = "astrocommunity.editing-support.treej", enabled = true },
  { import = "astrocommunity.editing-support.neogen", enabled = false },
  { import = "astrocommunity.editing-support.nvim-regexplainer", enabled = true },
  { import = "astrocommunity.comment.mini-comment", enabled = true },
  { import = "astrocommunity.bars-and-lines.scope-nvim", enabled = true },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim", enabled = true },
  { "smartcolumn.nvim", opts = { colorcolumn = 120, disabled_filetypes = { "help" } } },
  { import = "astrocommunity.code-runner.overseer-nvim", enabled = true },
  { import = "astrocommunity.markdown-and-latex.glow", enabled = false },
}
