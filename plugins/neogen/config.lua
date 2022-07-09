require("neogen").setup {
  snippet_engine = "luasnip",
  languages = {
    python = { template = { annotation_convention = "google_docstrings" } },
    typescript = { template = { annotation_convention = "tsdoc" } },
    typescriptreact = { template = { annotation_convention = "tsdoc" } },
  },
}
