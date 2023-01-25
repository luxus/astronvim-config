return {
  {
    "b0o/incline.nvim",
    init = function() table.insert(astronvim.file_plugins, "incline.nvim") end,
    config = true,
  },
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      { "<A-h>", function() require("smart-splits").move_cursor_left() end, desc = "Left Pane" },
      { "<A-j>", function() require("smart-splits").move_cursor_down() end, desc = "Down Pane" },
      { "<A-k>", function() require("smart-splits").move_cursor_up() end, desc = "Up Pane" },
      { "<A-l>", function() require("smart-splits").move_cursor_right() end, desc = "Right Pane" },
      { "<Up>", function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
      { "<Down>", function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
      { "<Left>", function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
      {
        "<Right>",
        function() require("smart-splits").resize_right(2) end,
        desc = "Resize split right",
      },
    },
  },
  -- noicer ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- enabled = false,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      messages = { enabled = false },
      presets = {
        inc_rename = true,
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = "rounded",
      },
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
  -- silly drops
  {
    "folke/drop.nvim",
    event = "VeryLazy",
    -- enabled = false,
    config = function()
      math.randomseed(os.time())
      local theme = ({ "stars", "snow" })[math.random(1, 3)]
      require("drop").setup { theme = theme }
    end,
  },
  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    init = function() table.insert(astronvim.file_plugins, "nvim-scrollbar") end,
    config = true,
    opts = {
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" },
    },
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

  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    -- enabled = false,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { "Up", "Down" } do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require "mini.animate"
      return {
        resize = {
          timing = animate.gen_timing.linear { duration = 100, unit = "total" },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 150, unit = "total" },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
      }
    end,
    config = function(_, opts) require("mini.animate").setup(opts) end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = true,
  },
  {
    "andweeb/presence.nvim",
    -- enabled = false,
    event = "VeryLazy",
  },
}
