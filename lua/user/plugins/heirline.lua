local status = require "user.util.statusline"
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    opts.winbar = nil
    -- opts.statusline[9] = astronvim.status.component.lsp { lsp_progress = false }
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      astronvim.status.component.mode(),
      astronvim.status.component.git_branch(),
      -- -- Custom component for grapple
      astronvim.status.component.builder {
        { provider = status.grapple },
        surround = {
          separator = "left",
        },
      },
      astronvim.status.component.file_info { filetype = {}, filename = false, file_modified = false },
      astronvim.status.component.git_diff(),
      astronvim.status.component.diagnostics(),
      astronvim.status.component.breadcrumbs(),
      astronvim.status.component.fill(),
      astronvim.status.component.cmd_info(),
      astronvim.status.component.fill(),
      astronvim.status.component.nav(),
      astronvim.status.component.mode { surround = { separator = "right" } },
    }

    opts.tabline[2] =
      astronvim.status.heirline.make_buflist(astronvim.status.component.tabline_file_info { close_button = false })
  end,
}
