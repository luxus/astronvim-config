return function(config)
  if vim.g.heirline_bufferline then -- TODO: remove if statement with v3 release
    config[3][2] =
      astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })
  end

  return config
end
