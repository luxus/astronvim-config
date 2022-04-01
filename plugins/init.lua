return function(plugins)
  local my_plugins = {
    {
      "EdenEast/nightfox.nvim",
      config = function()
        require("nightfox").setup(require "user.plugins.nightfox")
      end,
    },
    { "andymass/vim-matchup", event = { "BufRead", "BufNewFile" } },
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
      "echasnovski/mini.nvim",
      config = function()
        require "user.plugins.mini"()
      end,
    },
    {
      "ellisonleao/glow.nvim",
      cmd = "Glow",
      module = "glow",
      config = function()
        vim.g.glow_border = "rounded"
      end,
    },
    {
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
      end,
    },
    {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      module = "zen-mode",
      config = function()
        require("zen-mode").setup(require "user.plugins.zen-mode")
      end,
    },
    { "hrsh7th/cmp-calc", after = "nvim-cmp" },
    { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
    { "jbyuki/nabla.nvim", module = "nabla" },
    { "jc-doyle/cmp-pandoc-references", after = "nvim-cmp" },
    { "kdheepak/cmp-latex-symbols", after = "nvim-cmp" },
    {
      "mfussenegger/nvim-dap",
      module = "dap",
      config = require "user.plugins.dap",
    },
    {
      "mickael-menu/zk-nvim",
      module = { "zk", "zk.commands" },
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
    { "nanotee/sqls.nvim", after = "nvim-lspconfig" },
    {
      "phaazon/hop.nvim",
      event = { "BufRead", "BufNewFile" },
      branch = "v1",
      config = function()
        require("hop").setup()
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = function()
        local dap, dapui = require "dap", require "dapui"
        dapui.setup(require "user.plugins.dapui")
        -- add listeners to auto open DAP UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    { "skywind3000/asyncrun.vim", event = { "BufRead", "BufNewFile" } },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    {
      "nvim-telescope/telescope-bibtex.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "bibtex"
      end,
    },
    { "nvim-telescope/telescope-hop.nvim", event = "BufWinEnter" },
    {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "media_files"
      end,
    },
    {
      "nvim-telescope/telescope-project.nvim",
      after = "telescope.nvim",
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
    { "wakatime/vim-wakatime", event = "BufRead" },
  }

  -- Disabled Default Plugins
  plugins["glepnir/dashboard-nvim"] = nil
  plugins["karb94/neoscroll.nvim"] = nil
  plugins["max397574/better-escape.nvim"] = nil
  plugins["lukas-reineke/indent-blankline.nvim"] = nil
  plugins["numToStr/Comment.nvim"] = nil

  -- Disabled Default Lazy Loading
  plugins["nvim-neo-tree/neo-tree.nvim"]["cmd"] = nil
  plugins["nvim-neo-tree/neo-tree.nvim"]["module"] = nil

  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
