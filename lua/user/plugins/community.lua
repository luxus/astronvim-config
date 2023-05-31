return {
  { "AstroNvim/astrocommunity", dev = false }, -- loading community plugins
  -- basic packs
  { import = "astrocommunity.pack.lua", enabled = true },
  { import = "astrocommunity.pack.json", enabled = true },
  { import = "astrocommunity.pack.bash", enabled = true },
  { import = "astrocommunity.pack.markdown", enabled = true },
  { import = "astrocommunity.pack.yaml", enabled = true },
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
  { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },

  {
    "gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },

  { import = "astrocommunity.utility.noice-nvim" },
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
  { import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
  { import = "astrocommunity.indent.mini-indentscope", enabled = true },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2", enabled = true },
  { import = "astrocommunity.comment.mini-comment", enabled = true },
  { import = "astrocommunity.media.vim-wakatime", enabled = true },
  { import = "astrocommunity.project.nvim-spectre", enabled = true },
  { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },
  { import = "astrocommunity.code-runner.sniprun", enabled = true },
  { import = "astrocommunity.editing-support.dial-nvim", enabled = true },
  { import = "astrocommunity.editing-support.text-case-nvim", enabled = true },
  { import = "astrocommunity.terminal-integration.flatten-nvim", enabled = true },
  { import = "astrocommunity.syntax.hlargs-nvim", enabled = true },
  { import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
  { import = "astrocommunity.lsp.inc-rename", enabled = true },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim", enabled = true },
  { import = "astrocommunity.project.neoconf-nvim", enabled = true },
  { import = "astrocommunity.motion.mini-move", enabled = true },
  { import = "astrocommunity.motion.mini-surround", enabled = true },
  { import = "astrocommunity.motion.mini-bracketed", enabled = true },
  { import = "astrocommunity.motion.leap-nvim", enabled = true },
  { import = "astrocommunity.test.neotest", enabled = true },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.editing-support.refactoring-nvim", enabled = false },
  { import = "astrocommunity.editing-support.zen-mode-nvim", enabled = false },
  { import = "astrocommunity.editing-support.neogen", enabled = false },
  { import = "astrocommunity.git.neogit", enabled = false },
  { import = "astrocommunity.bars-and-lines.scope-nvim", enabled = false },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim", enabled = true },
  { import = "astrocommunity.code-runner.overseer-nvim", enabled = false },
  { import = "astrocommunity.git.octo", enabled = true },
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
