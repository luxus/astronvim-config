return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>Rs", desc = "Send request" },
    { "<leader>Ra", desc = "Send all requests" },
    { "<leader>Rb", desc = "Open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    -- your configuration comes here
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local kulala = require "kulala"
        local prefix = "<Leader>r"
        opts.filetypes.extension = { http = "http" }
        maps.n[prefix] = { desc = "Kulala" }
        maps.v[prefix] = { desc = "Kulala" }
        maps.n[prefix .. "s"] = { function() kulala.run() end, desc = "Send Request" }
        maps.v[prefix .. "s"] = { function() kulala.run() end, desc = "Send request" }
        maps.n[prefix .. "a"] = { function() kulala.run_all() end, desc = "Send all requests" }
        maps.v[prefix .. "a"] = { function() kulala.run_all() end, desc = "Send all requests" }
        maps.n[prefix .. "r"] = { function() kulala.replay() end, desc = "Replay the last request" }
      end,
    },
  },
}
