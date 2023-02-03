return {
  {
    "lervag/vimtex",
    config = function() vim.cmd "call vimtex#init()" end,
    ft = { "tex", "bib" },
    lazy = false,
  },
}
