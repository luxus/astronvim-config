return {
  tsserver = function(_, opts) require("typescript").setup { server = opts } end,
  clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
}
