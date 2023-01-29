return {
  { "NvChad/nvim-colorizer.lua", enabled = false },
  {
    "uga-rosa/ccc.nvim",
    -- event = "BufRead",
    --FIX: not loading sometimes on the first try
    init = function() table.insert(astronvim.file_plugins, "ccc.nvim") end,
    config = function() require("ccc").setup { highlighter = { auto_enable = true } } end,
    keys = { { "<leader>C", "<cmd>CccPick<cr>", desc = "Toggle colorizer" } },
  },
}
