return function()
  local status_ok, null_ls = pcall(require, "null-ls")
  if status_ok then
    local builtins = null_ls.builtins

    null_ls.setup {
      debug = false,
      sources = {
        builtins.code_actions.gitsigns,
        builtins.code_actions.shellcheck,
        builtins.formatting.stylua,
        builtins.formatting.black,
        builtins.formatting.isort,
        builtins.formatting.prettier.with {
          extra_filetypes = { "rmd" },
        },
        builtins.formatting.shfmt,
        builtins.diagnostics.cue_fmt,
        builtins.diagnostics.shellcheck,
      },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end,
    }
  end
end
