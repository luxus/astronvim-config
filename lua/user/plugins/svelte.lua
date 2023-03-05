return {
  "williamboman/mason-lspconfig.nvim",
  opts = function(_, opts)
    -- Ensure that opts.ensure_installed exists and is a table.
    if not opts.ensure_installed then opts.ensure_installed = {} end
    table.insert(opts.ensure_installed, "svelte")
  end,
}
