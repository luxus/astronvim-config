return {

  { "machakann/vim-sandwich", enabled = false },
  -- surround text
  {
    "echasnovski/mini.surround",
    -- keys = { "gz" },
    init = function() table.insert(astronvim.file_plugins, "mini.surround") end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict with leap
      require("mini.surround").setup(opts)
    end,
  },
}
