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
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "ahmedkhalf/project.nvim",
      config = function(_, opts) require("project_nvim").setup(opts) end,
      opts = {
        ignore_lsp = { "lua_ls" },
      },
    },
  },
  keys = {
    -- telescope plugin mappings
    { "<leader>fB", "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    { "<leader>fM", "<cmd>Telescope media_files<cr>", desc = "Find media" },
    {
      "<leader>fp",
      function() require("telescope").extensions.projects.projects {} end,
      desc = "Find projects",
    },
    { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo" },
    { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
    { "<leader>fl", "<cmd>Telescope lazy<cr>", desc = "Lazy" },

    -- open buffers
    {
      "<Tab>",
      function()
        if #vim.t.bufs > 1 then require("telescope.builtin").buffers { previewer = false, sort_lastused = true } end
      end,
      desc = "Switch Buffers",
    },
  },
  opts = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local previewers = require "telescope.previewers"
    local fb_actions = require("telescope").extensions.file_browser.actions
    local hop = telescope.extensions.hop
    return require("astronvim.utils").extend_tbl(opts, {
      live_grep = {
        border = true,
        previewer = false,
        shorten_path = false,
        layout_strategy = "flex",
        layout_config = {
          width = 0.9,
          height = 0.8,
          horizontal = { width = { padding = 0.15 } },
          vertical = { preview_height = 0.75 },
        },
        file_ignore_patterns = {
          "vendor/*",
          "node_modules",
          "%.jpg",
          "%.jpeg",
          "%.png",
          "%.svg",
          "%.otf",
          "%.ttf",
          "spell/*",
        },
      },
      defaults = {
        -- file_previewer = previewers.cat.new,
        -- grep_previewer = previewers.vimgrep.new,
        -- qflist_previewer = previewers.qflist.new,
        selection_caret = "  ",
        layout_config = {
          width = 0.90,
          height = 0.85,
          preview_cutoff = 120,
          prompt_position = "bottom",
          horizontal = {
            preview_width = function(_, cols, _) return math.floor(cols * 0.6) end,
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
        buffers = {
          path_display = { "smart" },
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["d"] = actions.delete_buffer },
          },
        },
      },
    })
  end,
  config = function(...)
    require "plugins.configs.telescope"(...)
    local telescope = require "telescope"
    telescope.load_extension "bibtex"
    telescope.load_extension "file_browser"
    telescope.load_extension "media_files"
    telescope.load_extension "projects"
    telescope.load_extension "undo"
    telescope.load_extension "zoxide"
    telescope.load_extension "lazy"
    telescope.load_extension "fzf"
  end,
}
