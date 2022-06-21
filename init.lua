return {
  updater = { skip_prompts = true },
  colorscheme = "duskfox",
  lsp = require "user.lsp",
  polish = function()
    vim.filetype.add {
      pattern = {
        ["/tmp/neomutt.*"] = "markdown",
      },
    }
    require "user.autocmds"
  end,
}
