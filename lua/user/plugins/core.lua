return {
  { "nvim-neo-tree/neo-tree.nvim", version = false, branch = "main" }, -- use mainline neo-tree for testing new fix
  { "goolord/alpha-nvim", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },

  { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
  { "folke/which-key.nvim", opts = { window = { border = "none" } } },
}
