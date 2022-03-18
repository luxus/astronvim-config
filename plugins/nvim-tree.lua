return {
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "s", action = "vsplit" },
        { key = "S", action = "split" },
        { key = ".", action = "cd" },
        { key = "<BS>", action = "dir_up" },
      },
    },
  },
}
