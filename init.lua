return {
  colorscheme = "duskfox",
  lsp = require "user.lsp",
  ["which-key"] = require "user.which-key",

  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      emoji = 700,
      pandoc_references = 700,
      latex_symbols = 700,
      calc = 650,
      path = 500,
      buffer = 250,
    },
  },

  polish = function()
    vim.filetype.add {
      pattern = {
        ["/tmp/neomutt.*"] = "markdown",
      },
    }
    require "user.autocmds"
    require "user.mappings"
  end,
}
