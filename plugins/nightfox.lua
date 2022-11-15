require("nightfox").setup {
  options = {
    dim_inactive = true,
    styles = { comments = "italic" },
    module_default = false,
    modules = {
      aerial = true,
      cmp = true,
      ["dap-ui"] = true,
      diagnostic = true,
      gitsigns = true,
      hop = true,
      native_lsp = true,
      neotree = true,
      notify = true,
      telescope = true,
      treesitter = true,
      tsrainbow = true,
      whichkey = true,
    },
  },
  groups = { all = { NormalFloat = { link = "Normal" } } },
}
