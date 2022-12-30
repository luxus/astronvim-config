return {
  ["goolord/alpha-nvim"] = { enabled = false },
  ["max397574/better-escape.nvim"] = { enabled = false },

  ["nvim-treesitter/nvim-treesitter"] = {
    dependencies = {
      ["andymass/vim-matchup"] = {},
      ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
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
      ["mxsdev/nvim-dap-vscode-js"] = { config = require "user.plugins.dap-vscode-js" },
      ["theHamsta/nvim-dap-virtual-text"] = { config = true },
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
  ["jose-elias-alvarez/null-ls.nvim"] = {
    dependencies = {
      ["jayp0521/mason-null-ls.nvim"] = {
        config = function()
          require "configs.mason-null-ls"
          local null_ls = require "null-ls"
          require("mason-null-ls").setup_handlers {
            prettierd = function()
              null_ls.register(
                null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
              )
            end,
          }
        end,
      },
    },
  },

  ["EdenEast/nightfox.nvim"] = { config = require "user.plugins.nightfox" },
  ["arsham/indent-tools.nvim"] = {
    init = function() table.insert(astronvim.file_plugins, "indent-tools.nvim") end,
    dependencies = { ["arsham/arshlib.nvim"] = {} },
    config = function() require("indent-tools").config {} end,
  },
  ["danymat/neogen"] = { cmd = "Neogen", config = require "user.plugins.neogen" },
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = require "user.plugins.nvim-lastplace",
  },
  ["jose-elias-alvarez/typescript.nvim"] = {
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    config = function() require "user.plugins.typescript" end,
  },
  ["junegunn/vim-easy-align"] = { init = function() table.insert(astronvim.file_plugins, "vim-easy-align") end },
  ["lvimuser/lsp-inlayhints.nvim"] = { config = true },
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
