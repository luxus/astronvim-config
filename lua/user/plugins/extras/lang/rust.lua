return {
  {
    {
      "simrat39/rust-tools.nvim",
      ft = { "rs" },
      opts = function() return { server = astronvim.lsp.config "rust_analyzer" } end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = { automatic_installation = { "rust_analyzer", "taplo" } },
    },
    {
      "Saecki/crates.nvim",
      ft = { "toml" },
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
  },
}
