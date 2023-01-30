return {
  {
    "gbprod/cutlass.nvim",
    keys = {
      { "x", mode = { "n", "x" } },
      { "d", mode = { "n", "x" } },
      { "c", mode = { "n", "x" } },
      { "m", mode = { "n", "x" } },
      { "X", mode = { "n", "x" } },
      { "D", mode = { "n", "x" } },
      { "C", mode = { "n", "x" } },
    },
    config = function()
      require("cutlass").setup {
        exclude = { "ns", "nS" },
        cut_key = "m",
      }
    end,
  },
}
