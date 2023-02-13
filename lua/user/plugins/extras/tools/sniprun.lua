return {
  {
    "michaelb/sniprun",
    init = function() require("which-key").register({ ["<leader>r"] = { name = "Run" } }, { mode = "n", "v" }) end,
    keys = {
      { "<leader>rr", function() require("sniprun").run() end, desc = "Sniprun" },
      { "<leader>rr", mode = { "x" }, function() require("sniprun").run "v" end, desc = "Sniprun" },
    },
    opts = {
      live_mode_toggle = "enable",
      live_display = { "VirtualText", "TerminalOk" },
    },
    build = "bash ./install.sh 1",
    cmd = "SnipRun",
  },
}
