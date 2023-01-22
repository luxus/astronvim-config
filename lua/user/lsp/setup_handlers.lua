return {
  tsserver = function(_, opts) require("typescript").setup { server = opts } end,
  clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
  rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
}
