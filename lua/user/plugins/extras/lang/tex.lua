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
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "latex" }) end
    end,
  },
}
