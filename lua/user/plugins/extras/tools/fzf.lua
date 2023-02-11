return {
  {
    "ibhagwan/fzf-lua",
    config = true,
    event = "VeryLazy",
    keys = { { "<leader>F", function() require("fzf-lua").files() end, desc = "FZF" } },
  },
}
