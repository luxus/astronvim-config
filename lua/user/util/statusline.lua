local M = {}

function M.grapple()
  local key_exists = require("grapple").exists()
  local key_name = "ﰠ "
  if key_exists then
    local tag = require("grapple").key()
    key_name = "笠" .. tag .. " "
  end
  return key_name
end

function M.set_grapple_color(hl)
  local key = require("grapple").exists()
  local key_color = "bg"
  if key then key_color = M.mode_color(hl) end
  return key_color
end

return M
