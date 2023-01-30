return {
  {
    "gbprod/cutlass.nvim",
    keys = {
      "x",
      "d",
      "c",
      "X",
      "D",
      "C",
      "m",
    },
    config = function()
      require("cutlass").setup {
        exclude = { "ns", "nS" },
        cut_key = "m",
      }
    end,
  },
}
