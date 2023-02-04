return {
  -- move lines or selections in all directions
  {
    "echasnovski/mini.move",
    config = function(_, opts) require("mini.move").setup(opts) end,
    enabled = true,
    keys = {
      { "H", mode = { "n", "x" } },
      { "J", mode = { "n", "x" } },
      { "K", mode = { "n", "x" } },
      { "L", mode = { "n", "x" } },
    },
    opts = {
      mappings = {
        left = "H",
        right = "L",
        down = "J",
        up = "K",
        line_left = "H",
        line_right = "L",
        line_down = "J",
        line_up = "K",
      },
    },
  },
}
