if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "smoka7/multicursors.nvim",
  dependencies = {
    "nvimtools/hydra.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          v = {
            -- FIX: add v
            ["<leader>m"] = { "<cmd>MCstart<cr>", desc = "MC" },
          },
          n = {
            -- FIX: add v
            ["<leader>m"] = { "<cmd>MCstart<cr>", desc = "MC" },
          },
        },
      },
    },
  },
  opts = {},
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
}
