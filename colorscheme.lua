local theme_avail, _ = pcall(require, "nightfox")
if theme_avail then
  return "duskfox"
else
  return "default_theme"
end
