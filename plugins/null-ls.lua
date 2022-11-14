local builtins = require("null-ls").builtins
return {
  sources = {
    builtins.code_actions.gitsigns,
    builtins.diagnostics.cue_fmt,
    builtins.formatting.cue_fmt,
  },
}
