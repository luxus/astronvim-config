return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Ensure that opts.ensure_installed exists and is a table or string "all".
    if not opts.ensure_installed then
      opts.ensure_installed = {}
    elseif opts.ensure_installed == "all" then
      return
    end
    -- Add the language to opts.ensure_installed.
    vim.list_extend(opts.ensure_installed, { "jsonc", "json" })
  end,
}
