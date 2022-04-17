return {
  setup = function()
    vim.filetype.add {
      pattern = {
        ["/tmp/neomutt.*"] = "markdown",
      },
    }
  end,
}
