---@type LazySpec
return {
  --FIX: remove after 5.0 release
  { "AstroNvim/astrocore", version = false, branch = "v2" },
  { "AstroNvim/astrolsp", version = false, branch = "v3" },
  { "AstroNvim/astroui", version = false, branch = "v3" },
  { "markview.nvim", opts = { filetypes = { "markdown", "markdown.mdx", "quarto", "typst" } } },
}
