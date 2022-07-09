return function()
  vim.filetype.add {
    pattern = {
      ["/tmp/neomutt.*"] = "markdown",
    },
  }
  require "user.autocmds"
end
