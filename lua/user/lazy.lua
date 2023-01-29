-- Configure require("lazy").setup() options
return {
  defaults = { lazy = true },
  install = { colorscheme = { "everforest" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- customize default disabled vim plugins
      disabled_plugins = {
        "nvim-treesitter-textobjects",
        "tohtml",
        "gzip",
        "matchit",
        "zipPlugin",
        "netrwPlugin",
        "tarPlugin",
        "matchparen",
      },
    },
  },
}
