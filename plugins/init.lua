return {
  ["goolord/alpha-nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },

  ["EdenEast/nightfox.nvim"] = { config = function() require "user.plugins.nightfox" end },
  ["akinsho/git-conflict.nvim"] = { tag = "*", config = function() require "user.plugins.git-conflict" end },
  ["andweeb/presence.nvim"] = { module = "presence" },
  ["andymass/vim-matchup"] = { after = "nvim-treesitter" },
  ["arsham/indent-tools.nvim"] = {
    requires = { "arsham/arshlib.nvim" },
    config = function() require "user.plugins.indent-tools" end,
  },
  ["danymat/neogen"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    module = "neogen",
    cmd = "Neogen",
    config = function() require "user.plugins.neogen" end,
  },
  ["dhruvasagar/vim-table-mode"] = {
    cmd = "TableModeToggle",
    config = function() require "user.plugins.vim-table-mode" end,
  },
  ["ethanholz/nvim-lastplace"] = { config = function() require "user.plugins.nvim-lastplace" end },
  ["hrsh7th/cmp-calc"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-calc" end },
  ["hrsh7th/cmp-emoji"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-emoji" end },
  ["hrsh7th/cmp-omni"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-omni" end },
  ["jayp0521/mason-nvim-dap.nvim"] = {
    after = { "mason.nvim", "nvim-dap" },
    config = function() require "user.plugins.mason-nvim-dap" end,
  },
  ["jbyuki/nabla.nvim"] = { module = "nabla" },
  ["jc-doyle/cmp-pandoc-references"] = {
    after = "nvim-cmp",
    config = function() require "user.plugins.cmp-pandoc-references" end,
  },
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.typescript" end,
  },
  ["kdheepak/cmp-latex-symbols"] = {
    after = "nvim-cmp",
    config = function() require "user.plugins.cmp-latex-symbols" end,
  },
  ["kylechui/nvim-surround"] = { tag = "*", config = function() require "user.plugins.nvim-surround" end },
  ["lukas-reineke/headlines.nvim"] = {
    ft = { "markdown", "rmd", "qmd" },
    config = function() require "user.plugins.headlines" end,
  },
  ["mfussenegger/nvim-dap"] = {},
  ["mickael-menu/zk-nvim"] = { module = { "zk", "zk.commands" }, config = function() require "user.plugins.zk" end },
  ["mtikekar/nvim-send-to-term"] = {
    cmd = "SendHere",
    config = function() require "user.plugins.nvim-send-to-term" end,
  },
  ["mxsdev/nvim-dap-vscode-js"] = {
    after = "mason-nvim-dap.nvim",
    config = function() require "user.plugins.nvim-dap-vscode-js" end,
  },
  ["nanotee/sqls.nvim"] = { module = "sqls" },
  ["nvim-telescope/telescope-bibtex.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-bibtex" end,
  },
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-file-browser" end,
  },
  ["nvim-telescope/telescope-hop.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-hop" end,
  },
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-media-files" end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-project" end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["p00f/clangd_extensions.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.clangd_extensions" end,
  },
  ["phaazon/hop.nvim"] = {
    cmd = { "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWord" },
    branch = "v2",
    config = function() require "user.plugins.hop" end,
  },
  ["rcarriga/nvim-dap-ui"] = { after = "nvim-dap", config = function() require "user.plugins.dapui" end },
  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
    config = function() require "user.plugins.nvim-dap-virtual-text" end,
  },
  ["vitalk/vim-simple-todo"] = {
    keys = {
      "<Plug>(simple-todo-above)",
      "<Plug>(simple-todo-below)",
      "<Plug>(simple-todo-mark-as-done)",
      "<Plug>(simple-todo-mark-as-undone)",
      "<Plug>(simple-todo-mark-switch)",
      "<Plug>(simple-todo-new-list-item)",
      "<Plug>(simple-todo-new-list-item-start-of-line)",
    },
    config = function() require "user.plugins.vim-simple-todo" end,
  },
  ["wakatime/vim-wakatime"] = { event = "BufEnter" },
  ["ziontee113/syntax-tree-surfer"] = {
    cmd = {
      "STSSwapUpNormal",
      "STSSwapDownNormal",
      "STSSelectCurrentNode",
      "STSSelectMasterNode",
      "STSSelectParentNode",
      "STSSelectChildNode",
      "STSSelectPrevSiblingNode",
      "STSSelectNextSiblingNode",
      "STSSwapNextVisual",
      "STSSwapPrevVisual",
    },
    config = function() require "user.plugins.syntax-tree-surfer" end,
  },
}
