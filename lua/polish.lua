-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- load parameters for neovide
if vim.g.neovide then
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.cmd [[set guifont=MonoLisa,Symbols\ Nerd\ Font]]
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.transparency = 0.95
end
-- Enable spell and wrap for markdown and gitcommit
