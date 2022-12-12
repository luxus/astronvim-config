return function(config)
  if vim.g.heirline_bufferline then -- TODO: remove if statement with v3 release
    config[3][2] = astronvim.status.heirline.make_buflist(astronvim.status.component.file_info {
      file_icon = { padding = { left = 1 } },
      unique_path = { hl = { fg = "winbarnc_fg" } },
      padding = { left = 1, right = 1 },
      hl = function(self)
        return {
          fg = self.is_active and "tab_fg" or "tab_inactive_fg",
          bold = self.is_active,
          italic = self.is_active,
        }
      end,
      surround = false,
    })
  end

  return config
end
