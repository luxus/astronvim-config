-- Customize colors for each element each element has a `_fg` and a `_bg`
if true then return {} end
return function(colors)
  colors.git_branch_fg = require("core.utils").get_hlgroup "Conditional"
  return colors
end
