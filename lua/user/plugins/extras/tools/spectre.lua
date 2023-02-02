return {
  "mehalter/nvim-spectre", -- move to main repo after https://github.com/nvim-pack/nvim-spectre/pull/104
  -- "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = {
    { "<leader>ss", function() require("spectre").open() end, desc = "Spectre" },
    {
      "<leader>sw",
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },
    { "<leader>sf", function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
  },

  opts = function()
    local prefix = "<leader>s"
    return {
      mapping = {
        send_to_qf = { map = prefix .. "q" },
        replace_cmd = { map = prefix .. "c" },
        show_option_menu = { map = prefix .. "o" },
        run_current_replace = { map = prefix .. "C" },
        run_replace = { map = prefix .. "R" },
        change_view_mode = { map = prefix .. "v" },
        resume_last_search = { map = prefix .. "l" },
      },
    }
  end,
}
