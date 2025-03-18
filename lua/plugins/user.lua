---@type LazySpec
return {
  --FIX: remove after 5.0 release
  { "astrocore", version = false, branch = "v2" },
  { "astrolsp", version = false, branch = "v3" },
  { "astroui", version = false, branch = "v3" },
  { "telescope.nvim", enabled = false },
  { "markview.nvim", opts = { filetypes = { "markdown", "markdown.mdx", "quarto", "typst" } } },
  -- {
  --   "vyfor/cord.nvim",
  --   build = ":Cord update",
  --   opts = { editor = { client = "astronvim" } },
  -- },
}
