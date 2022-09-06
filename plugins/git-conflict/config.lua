require("git-conflict").setup {
  default_mappings = false,
  disable_diagnostics = true,
  highlights = {
    current = "DiffText",
    incoming = "DiffAdd",
    ancester = "DiffDelete",
  },
}
