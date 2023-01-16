return {
  { "goolord/alpha-nvim", enabled = false },
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    config = function()
      local logo = table.concat({
        " █████  ███████ ████████ ██████   ██████     ███    ██ ██    ██ ██ ███    ███",
        "██   ██ ██         ██    ██   ██ ██    ██    ████   ██ ██    ██ ██ ████  ████",
        "███████ ███████    ██    ██████  ██    ██    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "██   ██      ██    ██    ██   ██ ██    ██    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "██   ██ ███████    ██    ██   ██  ██████     ██   ████   ████   ██ ██      ██",
      }, "\n")
      local pad = string.rep(" ", 22)
      local function new_section(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      local starter = require "mini.starter"
      starter.setup {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file", "Telescope find_files", "Telescope"),
          new_section("Recent files", "Telescope oldfiles", "Telescope"),
          new_section("Grep text", "Telescope live_grep", "Telescope"),
          new_section("Config ", "e ~/projects/user", "Config"),
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
    end,
  },
}
