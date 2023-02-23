M = {}

function M.vim_opt_toggle(opt, on, off, name)
  if on == nil then on = true end
  if off == nil then off = false end
  if not name then name = opt end
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  require("astronvim.utils").notify(name .. " " .. (is_off and "Enabled" or "Disabled"))
end
-- Define the SwitchTheme function
function M.SwitchTheme(timeframes, default_bg)
  -- Get the current hour
  local hour = tonumber(os.date "%H")

  -- Find the current timeframe
  local current_tf = nil
  for _, tf in ipairs(timeframes) do
    if
      tf.end_hour <= tf.start_hour and (hour >= tf.start_hour or hour < tf.end_hour + 24)
      or tf.end_hour > tf.start_hour and (hour >= tf.start_hour and hour < tf.end_hour)
    then
      current_tf = tf
      break
    end
  end

  -- Set colorscheme
  local theme = current_tf and current_tf.theme or timeframes[1].theme
  local ok, err = pcall(vim.cmd, "colorscheme " .. theme)
  if not ok then print("Error setting colorscheme: " .. err) end

  -- Set background
  local bg = default_bg
  if current_tf then bg = current_tf.switch_bg and "light" or "dark" end
  vim.o.background = bg
end
return M
