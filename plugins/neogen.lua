local M = {}
M.snippet_engine = "luasnip"
M.languages = {}
M.languages.python = { template = { annotation_convention = "google_docstrings" } }
M.languages.typescript = { template = { annotation_convention = "tsdoc" } }
M.languages.typescriptreact = M.languages.typescript
return M
