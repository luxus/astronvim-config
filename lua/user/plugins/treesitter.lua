-- if true then return {} end

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "andymass/vim-matchup",
    "HiPhish/nvim-ts-rainbow2",
    "nvim-treesitter/nvim-treesitter-textobjects",
    { "nvim-treesitter/nvim-treesitter-context", config = true },
  },
  opts = {
    rainbow = {
      enable = true,
      disable = { "jsx", "cpp" },
      query = "rainbow-parens",
      max_file_lines = 3000,
    },
    auto_install = vim.fn.executable "tree-sitter" == 1,
    highlight = { disable = { "help" } },
    indent = { enable = true, disable = { "python" } },
    matchup = { enable = true, disable = { "julia" } },
  },
}
