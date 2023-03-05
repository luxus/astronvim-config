return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      elseif opts.ensure_installed == "all" then
        return
      end
      -- Add the language to opts.ensure_installed.
      table.insert(opts.ensure_installed, "bash")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then table.insert(opts.ensure_installed, { "bashls" }) end
    end,
  },
}
