return {
  "echasnovski/mini.misc",
  event = "VeryLazy",
  config = function()
    local misc = require "mini.misc"
    misc.setup_termbg_sync()
  end,
}
