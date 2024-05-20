---@type LazySpec
return {
  { "better-escape.nvim", enabled = false },
  { "LuaSnip", enabled = false },
  {
    "nightfox.nvim",
    optional = true,
    opts = {
      options = {
        dim_inactive = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
        inverse = { -- Inverse highlight for different types
          match_paren = true,
        },
      },
    },
  },
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
