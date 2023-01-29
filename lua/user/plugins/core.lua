return {
  -- disable some stuff
  { "nvim-neo-tree/neo-tree.nvim", version = false, branch = "main" }, -- use mainline neo-tree for testing new fix
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
  {
    "folke/which-key.nvim",
    opts = { window = { border = "none" } },
    config = function(plugin, opts)
      plugin.default_config(opts)
      -- Add bindings which show up as group name
      local wk = require "which-key"
      wk.register({
        a = { name = "Annotation" },
      }, { mode = "n", prefix = "<leader>" })
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.winbar = nil
      -- opts.statusline[9] = astronvim.status.component.lsp { lsp_progress = false }
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        astronvim.status.component.mode(),
        astronvim.status.component.git_branch(),
        -- -- Custom component for grapple
        -- astronvim.status.component.builder {
        --   { provider = status.grapple },
        --   surround = {
        --     separator = "left",
        --   },
        -- },
        astronvim.status.component.file_info { filetype = {}, filename = false, file_modified = false },
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.breadcrumbs(),
        astronvim.status.component.fill(),
        astronvim.status.component.cmd_info(),
        astronvim.status.component.fill(),
        astronvim.status.component.nav(),
        astronvim.status.component.mode { surround = { separator = "right" } },
      }

      opts.tabline[2] =
        astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "andymass/vim-matchup",
      "HiPhish/nvim-ts-rainbow2",
      { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
    opts = {
      rainbow = {
        enable = true,
        disable = { "jsx", "cpp" },
        query = "rainbow-parens",
        max_file_lines = 3000,
      },
      auto_install = vim.fn.executable "tree-sitter" == 1,
      highlight = { disable = { "help" } },
      indent = { enable = true, disable = { "python" } },
      matchup = { enable = true, disable = { "julia" } },
    },
  },
}
