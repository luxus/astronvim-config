return {
  setup_sources = function()
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      local config = cmp.get_config()
      config.sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "pandoc_references" },
        { name = "path" },
        { name = "calc" },
        { name = "emoji" },
        { name = "latex_symbols" },
      }, {
        { name = "buffer" },
      })
      cmp.setup(config)
    end
  end,
}
