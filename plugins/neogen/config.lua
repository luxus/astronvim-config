require("neogen").setup {
  snippet_engine = "luasnip",
  languages = {
    lua = { template = { annotation_convention = "ldoc" } },
    python = { template = { annotation_convention = "google_docstrings" } },
    typescript = { template = { annotation_convention = "tsdoc" } },
    typescriptreact = { template = { annotation_convention = "tsdoc" } },
  },
}
