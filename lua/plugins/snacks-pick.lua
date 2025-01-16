return {
  "folke/snacks.nvim",
  init = function() require("astrocore").load_plugin_with_func("snacks.nvim", vim.ui, "select") end,
  opts = { picker = { ui_select = true, formatters = { file = { filename_first = true } } } },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        -- local astro = require "astrocore"
        -- local is_available = astro.is_available
        maps.n["<Leader>f"] = vim.tbl_get(opts, "_map_sections", "f")
        if vim.fn.executable "git" == 1 then
          maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
          -- maps.n["<Leader>gb"] = {
          --   function() require("telescope.builtin").git_branches { use_file_path = true } end,
          --   desc = "Git branches",
          -- }
          maps.n["<Leader>gc"] = {
            function() require("snacks").picker.git_log() end,
            desc = "Git commits (repository)",
          }
          maps.n["<Leader>gC"] = {
            function() require("snacks").picker.git_log { current_file = true, follow = true } end,
            desc = "Git commits (current file)",
          }
          maps.n["<Leader>gt"] = { function() require("snacks").picker.git_status() end, desc = "Git status" }
        end
        maps.n["<Leader>f<CR>"] = { function() require("snacks").picker.resume() end, desc = "Resume previous search" }
        maps.n["<Leader>f'"] = { function() require("snacks").picker.marks() end, desc = "Find marks" }
        maps.n["<Leader>fl"] = {
          function() require("snacks").picker.lines() end,
          desc = "Find lines",
        }
        maps.n["<Leader>fa"] = {
          function() require("snacks").picker.files { cwd = vim.fn.stdpath "config", desc = "Config Files" } end,
          desc = "Find AstroNvim config files",
        }
        maps.n["<Leader>fb"] = { function() require("snacks").picker.buffers() end, desc = "Find buffers" }
        maps.n["<Leader>fc"] = { function() require("snacks").picker.grep_word() end, desc = "Find word under cursor" }
        maps.n["<Leader>fC"] = { function() require("snacks").picker.commands() end, desc = "Find commands" }
        maps.n["<Leader>ff"] = {
          function()
            require("snacks").picker.files {
              hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat ".git" or {}, "type") == "directory",
            }
          end,
          desc = "Find files",
        }
        maps.n["<Leader>fF"] = {
          function() require("snacks").picker.files { hidden = true, ignored = true } end,
          desc = "Find all files",
        }
        maps.n["<Leader>fg"] = { function() require("snacks").picker.git_files() end, desc = "Find git files" }
        maps.n["<Leader>fh"] = { function() require("snacks").picker.help() end, desc = "Find help" }
        maps.n["<Leader>fk"] = { function() require("snacks").picker.keymaps() end, desc = "Find keymaps" }
        maps.n["<Leader>fm"] = { function() require("snacks").picker.man() end, desc = "Find man" }
        -- if is_available "nvim-notify" then
        --   maps.n["<Leader>fn"] =
        --     { function() require("telescope").extensions.notify.notify() end, desc = "Find notifications" }
        -- end
        maps.n["<Leader>fo"] = { function() require("snacks").picker.recent() end, desc = "Find old files" }
        maps.n["<Leader>fr"] = { function() require("snacks").picker.registers() end, desc = "Find registers" }
        maps.n["<Leader>ft"] = { function() require("snacks").picker.colorschemes() end, desc = "Find themes" }
        if vim.fn.executable "rg" == 1 then
          maps.n["<Leader>fw"] = { function() require("snacks").picker.grep() end, desc = "Find words" }
          maps.n["<Leader>fW"] = {
            function() require("snacks").picker.grep { hidden = true, ignored = true } end,
            desc = "Find words in all files",
          }
        end
        maps.n["<Leader>lD"] = { function() require("snacks").picker.diagnostics() end, desc = "Search diagnostics" }
        maps.n["<Leader>ls"] = {
          function()
            -- if is_available "aerial.nvim" then
            --   require("telescope").extensions.aerial.aerial()
            -- else
            require("snacks").picker.lsp_symbols()
            -- end
          end,
          desc = "Search symbols",
        }
      end,
    },
    {
      "folke/todo-comments.nvim",
      optional = true,
      dependencies = { "folke/snacks.nvim" },
      specs = {
        {
          "AstroNvim/astrocore",
          opts = {
            mappings = {
              n = {
                ["<Leader>fT"] = function()
                  if not package.loaded["todo-comments"] then -- make sure to load todo-comments
                    require("lazy").load { plugins = { "todo-comments.nvim" } }
                  end
                  require("snacks").picker.todo_comments()
                end,
              },
            },
          },
        },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        commands = {
          find_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("snacks").picker.files { cwd = path }
          end,
        },
        window = { mappings = { F = "find_in_dir" } },
      },
    },
    { "nvim-telescope/telescope.nvim", enabled = false },
    { "stevearc/dressing.nvim", opts = { select = { enabled = false } } },
  },
}
