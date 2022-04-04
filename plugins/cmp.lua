return function(config)
  local cmp_ok, cmp = pcall(require, "cmp")
  local luasnip_ok, luasnip = pcall(require, "luasnip")

  if cmp_ok and luasnip_ok then
    config.mapping["<CR>"] = cmp.mapping.confirm()
    config.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    })
    config.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    })

    config.sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "pandoc_references" },
      { name = "path" },
      { name = "calc" },
      { name = "emoji" },
      { name = "latex_symbols" },
      { name = "buffer" },
    }
  end

  return config
end
