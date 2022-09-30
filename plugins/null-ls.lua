local null_ls = require "null-ls"
return {
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "rmd" } },
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.cue_fmt,
    null_ls.builtins.diagnostics.shellcheck,
  },
}
