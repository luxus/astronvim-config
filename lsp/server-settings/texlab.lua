return {
  settings = {
    texlab = {
      build = { onSave = true },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
}
