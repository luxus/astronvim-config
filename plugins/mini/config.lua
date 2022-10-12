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
    B = gen_spec.treesitter { a = "@block.outer", i = "@block.inner" },
    C = gen_spec.treesitter { a = "@conditional.outer", i = "@conditional.inner" },
    F = gen_spec.treesitter { a = "@function.outer", i = "@function.inner" },
    L = gen_spec.treesitter { a = "@loop.outer", i = "@loop.inner" },
    P = gen_spec.treesitter { a = "@parameter.outer", i = "@parameter.inner" },
    x = gen_spec.treesitter { a = "@class.outer", i = "@class.inner" },
  },
}
