return function()
  require("mini.bufremove").setup()
  require("mini.comment").setup()
  require("mini.indentscope").setup {
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation "none",
    },
    options = {
      indent_at_cursor = false,
    },
    symbol = "▏",
  }
  require("mini.jump").setup()
  require("mini.surround").setup()

  local disable = {
    "base16",
    "completion",
    "cursorword",
    "doc",
    "fuzzy",
    "jump2d",
    "misc",
    "pairs",
    "sessions",
    "starter",
    "statusline",
    "tabline",
    "trailspace",
  }

  for _, plugin in ipairs(disable) do
    vim.g["mini" .. plugin .. "_disable"] = true
  end
end
