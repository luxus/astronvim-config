return {
  {
    "cbochs/portal.nvim",
    keys = {
      { "<leader>o", function() require("portal").jump_backward {} end, desc = "Portal Jump backward" },
      { "<leader>i", function() require("portal").jump_forward {} end, desc = "Portal Jump forward" },
    },
    dependencies = {
      {
        "cbochs/grapple.nvim",
        enabled = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
          { "<leader> ", function() require("grapple").popup_tags() end, desc = "Grapple" },
          { "<leader>A", function() require("grapple").toggle() end, desc = "Tag in Grapple" },
          { "<leader>1", function() require("grapple").select { key = 1 } end, desc = "Grapple 1" },
          { "<leader>2", function() require("grapple").select { key = 2 } end, desc = "Grapple 2" },
          { "<leader>3", function() require("grapple").select { key = 3 } end, desc = "Grapple 3" },
          { "<leader>4", function() require("grapple").select { key = 4 } end, desc = "Grapple 4" },
        },
      },
    },
  },
}
