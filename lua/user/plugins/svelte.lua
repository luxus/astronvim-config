return {
  "williamboman/mason-lspconfig.nvim",
  opts = function(_, opts)
    -- Ensure that opts.ensure_installed exists and is a table.
    if not opts.ensure_installed then opts.ensure_installed = {} end
    -- Add lsps to opts.ensure_installed using vim.list_extend.
    vim.list_extend(opts.ensure_installed, { "svelte", "eslint" })
  end,
}
