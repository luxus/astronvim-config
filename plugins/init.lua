return function(plugins)
  local my_plugins = {
    { "andymass/vim-matchup" },
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        local catppuccin = require "catppuccin"
        catppuccin.setup(require "user.plugins.catppuccin")
        local colors = require("catppuccin.api.colors").get_colors()
        catppuccin.remap { FocusedSymbol = { fg = colors.yellow } }
      end,
    },
    {
      "danymat/neogen",
      module = "neogen",
      cmd = "Neogen",
      config = function()
        require("neogen").setup(require "user.plugins.neogen")
      end,
      requires = "nvim-treesitter/nvim-treesitter",
    },
    {
      "dhruvasagar/vim-table-mode",
      cmd = "TableModeToggle",
      config = function()
        vim.g.table_mode_corner = "|"
      end,
    },
    {
      "ellisonleao/glow.nvim",
      cmd = "Glow",
      config = function()
        vim.g.glow_border = "rounded"
      end,
    },
    {
      "ethanholz/nvim-lastplace",
      config = function()
        require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
      end,
    },
    {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      config = function()
        require("zen-mode").setup(require "user.plugins.zen-mode")
      end,
    },
    { "glts/vim-textobj-comment" },
    {
      "hrsh7th/cmp-calc",
      after = "nvim-cmp",
      config = function()
        local cmp = require "cmp"
        local config = cmp.get_config()
        table.insert(config.sources, { name = "calc" })
        cmp.setup(config)
      end,
    },
    {
      "hrsh7th/cmp-emoji",
      after = "nvim-cmp",
      config = function()
        local cmp = require "cmp"
        local config = cmp.get_config()
        table.insert(config.sources, { name = "emoji" })
        cmp.setup(config)
      end,
    },
    { "jbyuki/nabla.nvim", module = "nabla" },
    {
      "jc-doyle/cmp-pandoc-references",
      after = "nvim-cmp",
      config = function()
        local cmp = require "cmp"
        local config = cmp.get_config()
        table.insert(config.sources, { name = "pandoc_references" })
        cmp.setup(config)
      end,
    },
    { "kana/vim-textobj-indent" },
    { "kana/vim-textobj-line" },
    { "kana/vim-textobj-user" },
    {
      "kdheepak/cmp-latex-symbols",
      after = "nvim-cmp",
      config = function()
        local cmp = require "cmp"
        local config = cmp.get_config()
        table.insert(config.sources, { name = "latex_symbols" })
        cmp.setup(config)
      end,
    },
    { "machakann/vim-sandwich" },
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require "dap"
        dap.adapters.python = {
          type = "executable",
          command = "/usr/bin/python",
          args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch file",

            program = "${file}",
            pythonPath = function()
              return "python"
            end,
          },
        }
      end,
    },
    {
      "mickael-menu/zk-nvim",
      config = function()
        require("zk").setup(require "user.plugins.zk")
      end,
    },
    {
      "mtikekar/nvim-send-to-term",
      cmd = "SendHere",
      config = function()
        vim.g.send_disable_mapping = true
      end,
    },
    { "nanotee/sqls.nvim" },
    {
      "phaazon/hop.nvim",
      branch = "v1",
      config = function()
        require("hop").setup {}
      end,
    },
    {
      "preservim/vim-markdown",
      config = function()
        vim.g.vim_markdown_auto_insert_bullets = false
        vim.g.vim_markdown_new_list_item_indent = 0
      end,
    },
    { "sheerun/vim-polyglot" },
    { "skywind3000/asyncrun.vim" },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    {
      "nvim-telescope/telescope-bibtex.nvim",
      config = function()
        require("telescope").load_extension "bibtex"
      end,
    },
    { "nvim-telescope/telescope-hop.nvim" },
    {
      "nvim-telescope/telescope-media-files.nvim",
      config = function()
        require("telescope").load_extension "media_files"
      end,
    },
    {
      "nvim-telescope/telescope-project.nvim",
      config = function()
        require("telescope").load_extension "project"
      end,
    },
    {
      "vitalk/vim-simple-todo",
      config = function()
        vim.g.simple_todo_map_keys = false
      end,
    },
    { "wakatime/vim-wakatime" },
  }

  -- Disabled Default Plugins
  plugins["glepnir/dashboard-nvim"] = nil
  plugins["karb94/neoscroll.nvim"] = nil
  plugins["max397574/better-escape.nvim"] = nil

  -- Disabled Default Lazy Loading
  plugins["akinsho/nvim-toggleterm.lua"]["cmd"] = nil
  plugins["kyazdani42/nvim-tree.lua"]["cmd"] = nil
  plugins["nvim-telescope/telescope.nvim"]["cmd"] = nil

  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
