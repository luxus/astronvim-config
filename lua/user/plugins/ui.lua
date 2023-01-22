return {
  -- { "folke/which-key.nvim", enabled = false },
  -- { "ibhagwan/fzf-lua",
  --   config = true,
  --   keys = {
  --     {
  --       "<leader> ",
  --       "<cmd>lua require('fzf-lua').files()<CR>",
  --       desc = "fzf-lua",
  --     },
  --   },
  -- },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy", config = true },
  -- noicer ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
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
        bottom_search = true,
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
    enabled = true,
    config = function()
      math.randomseed(os.time())
      local theme = ({ "stars", "snow" })[math.random(1, 3)]
      require("drop").setup { theme = theme }
    end,
  },
  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = true,
    -- config = function()
    --   local scrollbar = require "scrollbar"
    --   local colors = require("tokyonight.colors").setup()
    --   scrollbar.setup {
    --     handle = { color = colors.bg_highlight },
    --     excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
    --     marks = {
    --       Search = { color = colors.orange },
    --       Error = { color = colors.error },
    --       Warn = { color = colors.warning },
    --       Info = { color = colors.info },
    --       Hint = { color = colors.hint },
    --       Misc = { color = colors.purple },
    --     },
    --   }
    -- end,
    opts = {
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" },
    },
  },
  {
    "echasnovski/mini.animate",
    lazy = true,
    config = function()
      local mouse_scrolled = false
      for _, scroll in ipairs { "Up", "Down" } do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set("", key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require "mini.animate"

      animate.setup {
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
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = true,
  },
  { "andweeb/presence.nvim", event = "VeryLazy" },
}
