local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return {}
end

local actions = require "telescope.actions"
local hop = telescope.extensions.hop

return {
  defaults = {
    mappings = {
      i = {
        -- Hop
        ["<C-h>"] = hop.hop,
        ["<C-space>"] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist,
          }
          hop._hop_loop(prompt_bufnr, opts)
        end,
      },
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
}
