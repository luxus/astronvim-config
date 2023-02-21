return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "rust", "toml" }) end
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    opts = function() return { server = require("core.utils.lsp").config "rust_analyzer" } end,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
          if type(opts.ensure_installed) == "table" then vim.list_extend(opts.ensure_installed, { "codelldb" }) end
        end,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "rust_analyzer", "taplo" })
      end
    end,
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer { sources = { { name = "crates" } } }
          require "crates"
        end,
      })
    end,
  },
}
