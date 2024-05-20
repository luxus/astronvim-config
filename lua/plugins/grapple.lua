-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "cbochs/grapple.nvim",
    dependencies = {
      { "AstroNvim/astroui", opts = { icons = { Grapple = "󰛢" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader><Leader>"
          maps.n[prefix] = { desc = require("astroui").get_icon("Grapple", 1, true) .. "Grapple" }
          maps.n[prefix .. "a"] = { "<CMD>Grapple tag<CR>", desc = "Add file" }
          maps.n[prefix .. "d"] = { "<CMD>Grapple untag<CR>", desc = "Remove file" }
          maps.n[prefix .. "t"] = { "<CMD>Grapple toggle<CR>", desc = "Toggle a file" }
          maps.n[prefix .. "e"] = { "<CMD>Grapple open_tags<CR>", desc = "Select from tags" }
          maps.n[prefix .. "l"] = { "<CMD>Grapple open_loaded<CR>", desc = "Select a loaded scope" }
          maps.n[prefix .. "s"] = { "<CMD>Grapple open_scopes<CR>", desc = "Select a project scope" }
          maps.n[prefix .. "x"] = { "<CMD>Grapple reset<CR>", desc = "Clear tags from current project" }
          maps.n["<C-n>"] = { "<CMD>Grapple cycle forward<CR>", desc = "Select next tag" }
          maps.n["<C-p>"] = { "<CMD>Grapple cycle backward<CR>", desc = "Select previous tag" }
        end,
      },
    },
    cmd = "Grapple",
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline[#opts.statusline] = status.component.builder {
        {
          provider = function()
            local available, grapple = pcall(require, "grapple")
            if available then return grapple.statusline() end
          end,
        },
        hl = status.hl.get_attributes "section",
        surround = {
          color = "section_bg",
          condition = function()
            local available, grapple = pcall(require, "grapple")
            return available and grapple.exists()
          end,
          separator = "right",
        },
      }
    end,
  },
}
