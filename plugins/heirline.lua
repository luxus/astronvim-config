return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts[3][2] =
      astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })
    return opts
  end,
}
