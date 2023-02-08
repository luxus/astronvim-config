return {
  {
    "b0o/incline.nvim",
    init = function() table.insert(astronvim.file_plugins, "incline.nvim") end,
    opts = {
      hide = {
        focused_win = false,
      },
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Left Pane" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Down Pane" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Up Pane" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Right Pane" },
      { "<C-Up>", function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
      { "<C-Down>", function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
      { "<C-Left>", function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
      { "<C-Right>", function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    },
  },

  -- auto-resize windows
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = false },
    },
    keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup {
        animation = { enable = false, duration = 150 },
      }
    end,
  },
  -- indent guides for Neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    init = function() table.insert(astronvim.file_plugins, "indent-blankline.nvim") end,
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    init = function() table.insert(astronvim.file_plugins, "mini.indentscope") end,
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "starter", "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },
}
