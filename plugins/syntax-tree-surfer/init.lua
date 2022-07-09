return {
  cmd = {
    "STSSwapUpNormal",
    "STSSwapDownNormal",
    "STSSelectCurrentNode",
    "STSSelectMasterNode",
    "STSSelectParentNode",
    "STSSelectChildNode",
    "STSSelectPrevSiblingNode",
    "STSSelectNextSiblingNode",
    "STSSwapNextVisual",
    "STSSwapPrevVisual",
  },
  config = function() require "user.plugins.syntax-tree-surfer.config" end,
}
