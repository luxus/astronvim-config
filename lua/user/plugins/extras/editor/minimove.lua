return {
  -- move lines or selections in all directions
  {
    "echasnovski/mini.move",
    config = function(_, opts) require("mini.move").setup(opts) end,
    keys = {
      { "<C-l>", mode = { "n", "v" } },
      { "<C-k>", mode = { "n", "v" } },
      { "<C-j>", mode = { "n", "v" } },
      { "<C-h>", mode = { "n", "v" } },
    },
    opts = {
      mappings = {
        left = "<C-h>",
        right = "<C-l>",
        down = "<C-j>",
        up = "<C-k>",
        line_left = "<C-h>",
        line_right = "<C-l>",
        line_down = "<C-j>",
        line_up = "<C-k>",
      },
    },
  },
}
