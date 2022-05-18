local M = {}
M.snippet_engine = "luasnip"
M.languages = {}
M.python = { template = { annotation_convention = "google_docstrings" } }
M.typescript = { template = { annotation_convention = "tsdoc" } }
M.typescriptreact = M.typescript
return M
