return {
  "lukas-reineke/indent-blankline.nvim",
  init = function() table.insert(astronvim.file_plugins, "indent-blankline.nvim") end,
  opts = {
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
    show_trailing_blankline_indent = false,
    show_current_context = false,
  },
}, {
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  init = function() table.insert(astronvim.file_plugins, "mini.indentscope") end,
  opts = {
    symbol = "│",
    options = { try_as_border = true },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fzf", "starter", "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function() vim.b.miniindentscope_disable = true end,
    })
    require("mini.indentscope").setup(opts)
  end,
}
