return {
  {
    "stevearc/oil.nvim",
    config = true,
    enabled = true,
    cmd = "Oil",
    keys = {
      { "<leader>O", function() require("oil").open() end, desc = "Open folder in Oil" },
    },
  },
}
