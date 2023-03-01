local prefix = "<leader>r"
return {
  {
    "michaelb/sniprun",
    keys = {
      { prefix, desc = "Sniprun" },
      { prefix .. "r", function() require("sniprun").run() end, desc = "Sniprun" },
      { prefix .. "r", mode = { "x" }, function() require("sniprun").run "v" end, desc = "Sniprun" },
    },
    opts = {
      live_mode_toggle = "enable",
      live_display = { "VirtualText", "TerminalOk" },
    },
    build = "bash ./install.sh 1",
    cmd = "SnipRun",
  },
}
