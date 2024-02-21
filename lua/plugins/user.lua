---@type LazySpec
return {
  { "better-escape.nvim", enabled = false },
  { "LuaSnip", enabled = false },
  {
    "gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
      numhl = true,
      -- signcolumn = false,
    },
  },
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
  {
    "echasnovski/mini.move",
    keys = {
      { "<leader>m", mode = "n", desc = "Move" },
      { "<leader>m", mode = "x", desc = "Move" },
    },
    opts = {
      mappings = {
        left = "<Leader>mh",
        right = "<Leader>ml",
        down = "<Leader>mj",
        up = "<Leader>mk",
        line_left = "<Leader>mh",
        line_right = "<Leader>ml",
        line_down = "<Leader>mj",
        line_up = "<Leader>mk",
      },
    },
  },
}
