return {
  {
    "goolord/alpha-nvim",
    enabled = true,
    opts = function(_, opts) -- override the options using lazy.nvim
      opts.section.header.val = require("user.plugins.alpha.banners").dashboard()
    end,
  },
  {
    "echasnovski/mini.starter",
    enabled = false,
    event = "VimEnter",
    -- enabled = false,
    opts = function()
      local logo = table.concat({
        " █████  ███████ ████████ ██████   ██████     ███    ██ ██    ██ ██ ███    ███",
        "██   ██ ██         ██    ██   ██ ██    ██    ████   ██ ██    ██ ██ ████  ████",
        "███████ ███████    ██    ██████  ██    ██    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "██   ██      ██    ██    ██   ██ ██    ██    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "██   ██ ███████    ██    ██   ██  ██████     ██   ████   ████   ██ ██      ██",
      }, "\n")
      local pad = string.rep(" ", 33)
      local function new_section(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      local starter = require "mini.starter"
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file", "Telescope git_files", "Telescope"),
          new_section("Recent files", "Telescope oldfiles", "Telescope"),
          new_section("Grep text", "Telescope live_grep", "Telescope"),
          new_section("Config ", "e ~/.config/astronvim", "Config"),
          new_section("Restore Session", "SessionManager! load_last_session", "Built-in"),
          new_section("Lazy", "Lazy", "Config"),
          new_section("New file", "ene | startinsert", "Built-in"),
          new_section("Quit", "qa", "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function() require("lazy").show() end,
        })
      end

      local starter = require "mini.starter"
      starter.setup(config)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 18)
          starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(starter.refresh)
        end,
      })
    end,
  },
}
