local prefix = "<leader>s"
return {
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { prefix, desc = "Search / Replace" },
      { prefix .. "s", function() require("spectre").open() end, desc = "Spectre" },
      {
        prefix .. "w",
        function() require("spectre").open_visual { select_word = true } end,
        desc = "Spectre (current word)",
      },
      { prefix .. "f", function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
    },

    opts = function()
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
  },
}
