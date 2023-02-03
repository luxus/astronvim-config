return {
  {
    "lervag/vimtex",
    init = function()
      vim.cmd [[syntax enable]]
      vim.cmd [[filetype plugin indent on]]
    end,
    config = function() vim.cmd "call vimtex#init()" end,
    ft = { "tex", "bib" },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = { "latex" },
      },
    },
  },
}
