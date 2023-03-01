return {
  {
    "tjdevries/sg.nvim",
    build = "cargo build --workspace",
    dependencies = { "plenary.nvim" },
    enabled = false,
    event = "VeryLazy",
  },
}
