return { -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    init = function() table.insert(astronvim.file_plugins, "nvim-scrollbar") end,
    config = true,
    opts = {
      excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" },
    },
  },
}
