return {
  "anuvyklack/hydra.nvim",
  lazy = true,
  --FIX: code only stolen from https://github.com/vsedov/nvim/tree/master/lua/modules/editor/hydra.
  -- not changed yet
  enabled = false,
  dependencies = "anuvyklack/keymap-layer.nvim",
  config = "user.plugins.hydra",
  event = "VeryLazy",
}
