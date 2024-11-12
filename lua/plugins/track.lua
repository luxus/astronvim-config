if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    -- no configuration needed
    "dharmx/track.nvim",

    -- recommended lazy load
    {
      "dharmx/track.nvim",
      dependency = {
        { "AstroNvim/astroui", opts = { icons = { Track = "󰍕" } } },
        {
          "AstroNvim/astrocore",
          opts = function(_, opts)
            local maps = opts.mappings
            local prefix = "<Leader><Leader>"
            maps.n[prefix] = { desc = require("astroui").get_icon("Track", 1, true) .. "Track" }
            maps.n[prefix .. "a"] = { "<CMD>Mark<CR>", desc = "Add file" }
            maps.n[prefix .. "<Leader>"] = { "<CMD>Track<CR>", desc = "Open Track" }
            maps.n[prefix .. "d"] = { "<CMD>Unmark<CR>", desc = "Remove file" }
            maps.n[prefix .. "e"] = { "<CMD>Track Bundles<CR>", desc = "Track Bundle" }
          end,
        },
      },
      opts = {},
      cmd = {
        "Mark",
        "Track",
        "MarkOpened",
        "StashBundle",
        "RestoreBundle",
        "AlternateBundle",
        "Unmark",
      },
    },
  },
}
