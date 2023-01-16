return { -- switch from colorizer to ccc
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    event = "BufRead",
    config = function() require("ccc").setup { highlighter = { auto_enable = true } } end,
  },
}
