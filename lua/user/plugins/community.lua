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
  { import = "astrocommunity.colorscheme.everforest", enabled = true },
  { import = "astrocommunity.colorscheme.nightfox", enabled = false },
  { import = "astrocommunity.colorscheme.kanagawa", enabled = false },
  { import = "astrocommunity.colorscheme.oxocarbon", enabled = true },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
  { import = "astrocommunity.colorscheme.onigiri", enabled = false },
  { import = "astrocommunity.colorscheme.tokyonight", enabled = true },
  { "tokyonight.nvim", opts = { style = "night", light_style = "storm" } },
  { import = "astrocommunity.colorscheme.mini-base16", enabled = false },
  { import = "astrocommunity.utility.neodim", enabled = true },
  { import = "astrocommunity.motion.mini-bracketed", enabled = true },
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
  { import = "astrocommunity.pack.typescript", enabled = true },
  { import = "astrocommunity.pack.python", enabled = false },
  { import = "astrocommunity.pack.lua", enabled = true },
  { import = "astrocommunity.pack.bash", enabled = true },
  { import = "astrocommunity.pack.svelte", enabled = true },
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
  { import = "astrocommunity.motion.mini-move", enabled = true },
  { import = "astrocommunity.motion.mini-surround", enabled = true },
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
  { import = "astrocommunity.comment.mini-comment", enabled = true },
  { import = "astrocommunity.bars-and-lines.scope-nvim", enabled = false },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim", enabled = true },
  { "smartcolumn.nvim", opts = { colorcolumn = 120, disabled_filetypes = { "help" } } },
  { import = "astrocommunity.code-runner.overseer-nvim", enabled = false },
  { import = "astrocommunity.markdown-and-latex.glow", enabled = false },
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

  { "m-demare/hlargs.nvim", opts = {}, event = "User AstroFile" },

  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
    deps = {
      "ggandor/leap.nvim",
      keys = {
        { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
      },
      config = function(_, opts)
        local leap = require "leap"
        for k, v in pairs(opts) do
          leap.opts[k] = v
        end
        leap.add_default_mappings(true)
      end,
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
    event = "User AstroFile",
    keys = {
      -- { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      -- { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
}
