local M = {}

function M.vim_opt_toggle(opt, on, off, name)
  if on == nil then on = true end
  if off == nil then off = false end
  if not name then name = opt end
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  require("astronvim.utils").notify(name .. " " .. (is_off and "Enabled" or "Disabled"))
end
return M
