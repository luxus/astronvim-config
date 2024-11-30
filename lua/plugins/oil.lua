---@type LazySpec
return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  init = function() -- start oil on startup lazily if necessary
    if vim.fn.argc() == 1 then
      local arg = vim.fn.argv(0)
      ---@cast arg string
      local stat = (vim.uv or vim.loop).fs_stat(arg)
      local adapter = string.match(arg, "^([%l-]*)://")
      if (stat and stat.type == "directory") or adapter == "oil-ssh" then require "oil" end
    end
  end,
  opts = function(_, opts)
    local astrocore, get_icon = require "astrocore", require("astroui").get_icon

    -- git status cache
    local git_avail = vim.fn.executable "git" == 1
    local function parse_output(commands)
      local result, ret = astrocore.cmd(commands, false), {}
      if result then
        for line in vim.gsplit(result, "\n", { plain = true, trimempty = true }) do
          ret[line:gsub("/$", "")] = true
        end
      end
      return ret
    end
    local git_status_index = function(self, key)
      local ignore = { "git", "-C", key, "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" }
      local tracked = { "git", "-C", key, "ls-tree", "HEAD", "--name-only" }
      local ret = { ignored = parse_output(ignore), tracked = parse_output(tracked) }
      rawset(self, key, ret)
      return ret
    end
    local new_git_status = function() return setmetatable({}, { __index = git_status_index }) end
    local git_status = new_git_status()
    -- clear git status cache on refresh
    local refresh = require("oil.actions").refresh
    refresh.callback = astrocore.patch_func(refresh.callback, function(orig, ...)
      git_status = new_git_status()
      orig(...)
    end)

    local columns = {
      icon = { "icon", default_file = get_icon "DefaultFile", directory = get_icon "FolderClosed" },
      permissions = { "permissions", highlight = "Type" },
      size = { "size", highlight = "String" },
      mtime = { "mtime", highlight = "Function" },
    }
    local simple, detailed = { columns.icon }, { columns.permissions, columns.size, columns.mtime, columns.icon }

    return astrocore.extend_tbl(opts, {
      columns = simple,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      watch_for_changes = true,
      keymaps = {
        gd = {
          desc = "Toggle detailed file view",
          callback = function() require("oil").set_columns(#require("oil.config").columns == 1 and detailed or simple) end,
        },
        R = "actions.refresh",
        ["<Tab>"] = "actions.close",
      },
      lsp_file_methods = { autosave_changes = "unmodified" },
      view_options = {
        is_hidden_file = function(name, bufnr)
          local dir = require("oil").get_current_dir(bufnr)
          local is_hidden = vim.startswith(name, ".") and name ~= ".."
          -- if no git or no local directory (e.g. for ssh connections), just hide dotfiles
          if not git_avail or not dir then return is_hidden end
          -- dotfiles are considered hidden unless tracked
          if is_hidden then
            return not git_status[dir].tracked[name]
          else
            -- Check if file is gitignored
            return git_status[dir].ignored[name]
          end
        end,
        is_always_hidden = function(name) return name == ".." end,
      },
      preview_win = {
        win_options = {
          foldcolumn = "0",
          number = false,
          relativenumber = false,
          signcolumn = "no",
        },
      },
    } --[[ @type oil.setupOpts ]])
  end,
  specs = {
    { "nvim-neo-tree/neo-tree.nvim", optional = true, opts = { filesystem = { hijack_netrw_behavior = "disabled" } } },
    {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          neotree_start = false,
          oil_start = {
            {
              event = "BufNew",
              desc = "start oil when editing a directory",
              callback = function()
                if package.loaded["oil"] then
                  vim.api.nvim_del_augroup_by_name "oil_start"
                elseif vim.fn.isdirectory(vim.fn.expand "<afile>") == 1 then
                  require "oil"
                  vim.api.nvim_del_augroup_by_name "oil_start"
                end
              end,
            },
          },
          oil_settings = {
            {
              event = "FileType",
              desc = "Disable view saving for oil buffers",
              pattern = "oil",
              callback = function(args) vim.b[args.buf].view_activated = false end,
            },
            {
              event = "User",
              pattern = "OilActionsPost",
              desc = "Logic to run after an action in Oil",
              callback = function(args)
                if args.data.err then return end
                for _, action in ipairs(args.data.actions) do
                  ---@cast action oil.Action
                  if action.type == "delete" then
                    ---@cast action oil.DeleteAction
                    local _, path = require("oil.util").parse_url(action.url)
                    local bufnr = vim.fn.bufnr(path)
                    if bufnr ~= -1 then require("astrocore.buffer").wipe(bufnr, true) end
                  end
                end
              end,
            },
          },
        },
        mappings = {
          n = {
            ["<Tab>"] = { "<Cmd>Oil<CR>", desc = "Oil Filebrowser" },
          },
        },
      },
    },
    { "AstroNvim/astroui", opts = { status = { winbar = { enabled = { filetype = { "^oil$" } } } } } },
    {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts)
        if opts.winbar then
          local status = require "astroui.status"
          table.insert(opts.winbar, 1, {
            condition = function(self) return status.condition.buffer_matches({ filetype = "^oil$" }, self.bufnr) end,
            status.component.separated_path {
              padding = { left = 2 },
              max_depth = false,
              suffix = false,
              path_func = function(self) return require("oil").get_current_dir(self.bufnr) end,
            },
          })
        end
      end,
    },
  },
}
