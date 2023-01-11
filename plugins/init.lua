return {
  { "goolord/alpha-nvim", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
  -- use mainline neo-tree for testing new fix
  { "nvim-neo-tree/neo-tree.nvim", version = false, branch = "main" },

  { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
  { "folke/which-key.nvim", opts = { window = { border = "none" } } },

  -- LSP Settings
  "nanotee/sqls.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "p00f/clangd_extensions.nvim",
  { "neovim/nvim-lspconfig", dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  } },

  {
    "arsham/indent-tools.nvim",
    dependencies = { "arsham/arshlib.nvim" },
    init = function() table.insert(astronvim.file_plugins, "indent-tools.nvim") end,
    config = function() require("indent-tools").config {} end,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = { template = { annotation_convention = "ldoc" } },
        typescript = { template = { annotation_convention = "tsdoc" } },
        typescriptreact = { template = { annotation_convention = "tsdoc" } },
      },
    },
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },
  { "junegunn/vim-easy-align", init = function() table.insert(astronvim.file_plugins, "vim-easy-align") end },
  { "machakann/vim-sandwich", init = function() table.insert(astronvim.file_plugins, "vim-sandwich") end },
  { "wakatime/vim-wakatime", init = function() table.insert(astronvim.file_plugins, "vim-wakatime") end },
}
