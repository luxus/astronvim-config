return {
  -- disable some stuff
  { "NvChad/nvim-colorizer.lua", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", version = false, branch = "main" }, -- use mainline neo-tree for testing new fix
  { "numToStr/Comment.nvim", enabled = false },
  -- { "windwp/nvim-autopairs", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
  { "machakann/vim-sandwich", enabled = false },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<C-q>", mode = { "t" }, "<C-\\><C-n>", desc = "Terminal normal mode" },
      { "<esc><esc>", mode = { "t" }, "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
    opts = { terminal_mappings = false },
  },
  { "folke/which-key.nvim", opts = { window = { border = "none" } } },
  { "nvim-treesitter/nvim-treesitter-context", config = true },
  {
    "folke/which-key.nvim",
    config = function(plugin, opts)
      plugin.default_config(opts)
      -- Add bindings which show up as group name
      local wk = require "which-key"
      wk.register({
        a = { name = "Annotation" },
      }, { mode = "n", prefix = "<leader>" })
    end,
  },
}
