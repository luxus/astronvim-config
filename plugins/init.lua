return {
  ["goolord/alpha-nvim"] = { enabled = false },
  ["max397574/better-escape.nvim"] = { enabled = false },
  ["nvim-treesitter/nvim-treesitter"] = {
    dependencies = {
      ["andymass/vim-matchup"] = {},
      ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
      ["ziontee113/syntax-tree-surfer"] = { config = function() require "user.plugins.syntax-tree-surfer" end },
    },
  },
  ["hrsh7th/nvim-cmp"] = {
    dependencies = {
      ["hrsh7th/cmp-calc"] = {},
      ["hrsh7th/cmp-emoji"] = {},
      ["jc-doyle/cmp-pandoc-references"] = {},
      ["kdheepak/cmp-latex-symbols"] = {},
    },
  },
  ["mfussenegger/nvim-dap"] = {
    dependencies = {
      ["mxsdev/nvim-dap-vscode-js"] = { config = function() require "user.plugins.nvim-dap-vscode-js" end },
      ["theHamsta/nvim-dap-virtual-text"] = { config = function() require "user.plugins.nvim-dap-virtual-text" end },
    },
  },
  ["nvim-telescope/telescope.nvim"] = {
    dependencies = {
      ["nvim-telescope/telescope-hop.nvim"] = {},
      ["nvim-telescope/telescope-bibtex.nvim"] = {},
      ["nvim-telescope/telescope-file-browser.nvim"] = {},
      ["nvim-telescope/telescope-media-files.nvim"] = {},
      ["nvim-telescope/telescope-project.nvim"] = {},
    },
    config = function()
      require "configs.telescope"
      local telescope = require "telescope"
      telescope.load_extension "bibtex"
      telescope.load_extension "file_browser"
      telescope.load_extension "media_files"
      telescope.load_extension "project"
    end,
  },

  ["EdenEast/nightfox.nvim"] = { config = function() require "user.plugins.nightfox" end },
  ["arsham/indent-tools.nvim"] = {
    init = function() table.insert(astronvim.file_plugins, "indent-tools.nvim") end,
    dependencies = { ["arsham/arshlib.nvim"] = {} },
    config = function() require "user.plugins.indent-tools" end,
  },
  ["danymat/neogen"] = { cmd = "Neogen", config = function() require "user.plugins.neogen" end },
  ["ethanholz/nvim-lastplace"] = {
    init = function() table.insert(astronvim.file_plugins, "nvim-lastplace") end,
    config = function() require "user.plugins.nvim-lastplace" end,
  },
  ["jose-elias-alvarez/typescript.nvim"] = {
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    config = function() require "user.plugins.typescript" end,
  },
  ["junegunn/vim-easy-align"] = { init = function() table.insert(astronvim.file_plugins, "vim-easy-align") end },
  ["lvimuser/lsp-inlayhints.nvim"] = { config = function() require "user.plugins.lsp-inlayhints" end },
  ["machakann/vim-sandwich"] = { init = function() table.insert(astronvim.file_plugins, "vim-sandwich") end },
  ["nanotee/sqls.nvim"] = {},
  ["p00f/clangd_extensions.nvim"] = {
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    config = function() require "user.plugins.clangd_extensions" end,
  },
  ["sindrets/diffview.nvim"] = {
    init = function() table.insert(astronvim.git_plugins, "diffview.nvim") end,
    config = function() require "user.plugins.diffview" end,
  },
  ["wakatime/vim-wakatime"] = { init = function() table.insert(astronvim.file_plugins, "vim-wakatime") end },
}
