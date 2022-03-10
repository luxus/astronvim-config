return function(plugins)
  local my_plugins = {
    { "andymass/vim-matchup" },
    {
      "mehalter/nvim-1",
      branch = "SymbolOutline",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup {
          transparent_background = false,
          term_colors = false,
          styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "italic",
          },
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
              },
              underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
              },
            },
            lsp_trouble = false,
            cmp = true,
            lsp_saga = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
              enabled = true,
              show_root = false,
              transparent_panel = false,
            },
            neotree = {
              enabled = false,
              show_root = true,
              transparent_panel = true,
            },
            which_key = true,
            indent_blankline = {
              enabled = true,
              colored_indent_levels = false,
            },
            dashboard = false,
            neogit = true,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = true,
            hop = true,
            notify = false,
            telekasten = false,
            symbols_outline = true,
          },
        }
      end,
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
        require("nvim-lastplace").setup {
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
          lastplace_open_folds = true,
        }
      end,
    },
    {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      config = function()
        require("zen-mode").setup {
          window = {
            backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            -- height and width can be:
            -- * an absolute number of cells when > 1
            -- * a percentage of the width / height of the editor when <= 1
            -- * a function that returns the width or the height
            width = 120, -- width of the Zen window
            height = 1, -- height of the Zen window
            -- by default, no options are changed for the Zen window
            -- uncomment any of the options below, or add other vim.wo options you want to apply
            options = {
              -- signcolumn = "no", -- disable signcolumn
              number = false, -- disable number column
              relativenumber = false, -- disable relative numbers
              -- cursorline = false, -- disable cursorline
              -- cursorcolumn = false, -- disable cursor column
              foldcolumn = "0", -- disable fold column
              -- list = false, -- disable whitespace characters
            },
          },
          plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
              enabled = true,
              ruler = false, -- disables the ruler text in the cmd line area
              showcmd = false, -- disables the command in the last line of the screen
            },
            twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
            gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = false }, -- disables the tmux statusline
            -- this will change the font size on kitty when in zen mode
            -- to make this work, you need to set the following kitty options:
            -- - allow_remote_control socket-only
            -- - listen_on unix:/tmp/kitty
            kitty = {
              enabled = false,
              font = "+4", -- font size increment
            },
          },
          -- callback where you can add custom code when the Zen window opens
          on_open = function(win) end,
          -- callback where you can add custom code when the Zen window closes
          on_close = function() end,
        }
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
        require("zk").setup {
          picker = "telescope",
          lsp = {
            config = {
              cmd = { "zk", "lsp" },
              name = "zk",
              on_attach = require("configs.lsp.handlers").on_attach,
              capabilities = require("configs.lsp.handlers").capabilities,
            },

            auto_attach = {
              enabled = true,
              filetypes = { "markdown" },
            },
          },
        }
      end,
    },
    {
      "mtikekar/nvim-send-to-term",
      cmd = "SendHere",
      config = function()
        vim.g.send_disable_mapping = true
      end,
    },
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
        vim.g.vim_markdown_folding_disabled = true
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
  plugins["windwp/nvim-autopairs"] = nil

  -- Disabled Default Lazy Loading
  plugins["akinsho/nvim-toggleterm.lua"]["cmd"] = nil
  plugins["nvim-telescope/telescope.nvim"]["cmd"] = nil
  plugins["nvim-treesitter/nvim-treesitter"]["cmd"] = nil
  plugins["nvim-treesitter/nvim-treesitter"]["event"] = nil

  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
