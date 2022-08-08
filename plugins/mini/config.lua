require("mini.bufremove").setup()
require("mini.comment").setup()
require("mini.jump").setup()
require("mini.surround").setup()
require("mini.indentscope").setup {
  draw = { delay = 0, animation = require("mini.indentscope").gen_animation "none" },
  options = { indent_at_cursor = false },
  symbol = "▏",
}
local gen_spec = require("mini.ai").gen_spec
require("mini.ai").setup {
  custom_textobjects = {
    ["*"] = gen_spec.pair("*", "*", { type = "greedy" }),
    ["_"] = gen_spec.pair("_", "_", { type = "greedy" }),
    F = gen_spec.treesitter { a = "@function.outer", i = "@function.inner" },
    x = gen_spec.treesitter { a = "@class.outer", i = "@class.inner" },
  },
}
