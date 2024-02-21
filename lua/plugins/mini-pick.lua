return {

  -- replacing telescope with mini.pick
  { "telescope.nvim", enabled = false },
  {
    "echasnovski/mini.pick",
    opts = {},
    version = false,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<leader>f"] = { desc = "Pick file" },
          ["<leader>ff"] = { function() require("mini.pick").builtin.files() end, desc = "Pick file" },
          ["<leader>fw"] = {
            function() require("mini.pick").builtin.grep_live() end,
            desc = "Pick word",
          },
          ["<tab><tab>"] = {
            function() require("mini.pick").builtin.buffers() end,
            desc = "Pick buffer",
          },
          ["<leader>fs"] = { "<cmd>Pick grep pattern='<cword>'<cr>", desc = "search in file" },
        },
      },
    },
  },
}
