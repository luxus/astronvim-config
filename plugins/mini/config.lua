require("mini.bufremove").setup()
require("mini.comment").setup()
require("mini.jump").setup()
require("mini.surround").setup()
require("mini.indentscope").setup {
  draw = { delay = 0, animation = require("mini.indentscope").gen_animation "none" },
  options = { indent_at_cursor = false },
  symbol = "▏",
}
