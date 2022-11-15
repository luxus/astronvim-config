local null_ls = require "null-ls"

return {
  prettierd = function()
    null_ls.register(null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } })
  end,
}
