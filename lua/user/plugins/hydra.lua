-- stylua: ignore
  --FIX: code only stolen from https://github.com/vsedov/nvim/tree/master/lua/modules/editor/hydra.
  -- not changed yet, the next line disable everything here
if true then return {} end
return {
  "anuvyklack/hydra.nvim",
  lazy = true,
  dependencies = "anuvyklack/keymap-layer.nvim",
  config = "user.plugins.hydra",
  event = "VeryLazy",
}
