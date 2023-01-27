return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-hop.nvim",
    "nvim-telescope/telescope-bibtex.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-project.nvim",
    "debugloop/telescope-undo.nvim",
    "jvgrootveld/telescope-zoxide",
    "tsakirist/telescope-lazy.nvim",
  },
  keys = {
    -- telescope plugin mappings
    { "<leader>fB", "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    { "<leader>fM", "<cmd>Telescope media_files<cr>", desc = "Find media" },
    { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Find projects" },
    { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo" },
    { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
    { "<leader>fl", "<cmd>Telescope lazy<cr>", desc = "Lazy" },

    -- open buffers
    {
      "<leader>b ",
      "<cmd>lua require('telescope.builtin').buffers({previewer = false, initial_mode='normal'})<cr>",
      desc = "Open buffers",
    },
  },
  opts = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions
    local hop = telescope.extensions.hop
    return astronvim.extend_tbl(opts, {
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
    })
  end,
  config = function(plugin, opts)
    plugin.default_config(opts)
    local telescope = require "telescope"
    telescope.load_extension "bibtex"
    telescope.load_extension "file_browser"
    telescope.load_extension "media_files"
    telescope.load_extension "project"
    telescope.load_extension "undo"
    telescope.load_extension "zoxide"
    telescope.load_extension "lazy"
  end,
}
