local telescope = require "telescope"
local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions
local hop = telescope.extensions.hop
return {
  defaults = {
    selection_caret = "  ",
    layout_config = {
      width = 0.90,
      height = 0.85,
      preview_cutoff = 120,
      horizontal = {
        preview_width = 0.6,
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },
      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },
    mappings = {
      i = {
        ["<C-h>"] = hop.hop,
        ["<C-space>"] = function(prompt_bufnr)
          hop._hop_loop(
            prompt_bufnr,
            { callback = actions.toggle_selection, loop_callback = actions.send_selected_to_qflist }
          )
        end,
      },
    },
  },
  extensions = {
    bibtex = { context = true, context_fallback = false },
    media_files = {
      filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
      find_cmd = "rg",
    },
    file_browser = {
      mappings = {
        i = {
          ["<C-z>"] = fb_actions.toggle_hidden,
        },
        n = {
          z = fb_actions.toggle_hidden,
        },
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
}
