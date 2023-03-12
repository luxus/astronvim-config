return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        overrideCommand = {
          "cargo",
          "clippy",
          "--workspace",
          "--message-format=json",
          "--all-targets",
          "--all-features",
        },
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        locationLinks = false,
      },
    },
  },
}
