local function fallback_setup(plugin, server, opts)
  local lsp_plugin_avail, _ = pcall(require, plugin)
  if not lsp_plugin_avail then require("lspconfig")[server].setup(opts) end
end

return {
  tsserver = function(...) fallback_setup("typescript", ...) end,
  clangd = function(...) fallback_setup("clangd_extensions", ...) end,
  rust_analyzer = function(...) fallback_setup("rust-tools", ...) end,
  gopls = function(...) fallback_setup("gopher", ...) end,
}
