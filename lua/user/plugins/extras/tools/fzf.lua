return {
  {
    "ibhagwan/fzf-lua",
    config = true,
    keys = { { "<leader>F", function() require("fzf-lua").files() end, desc = "FZF" } },
  },
}
