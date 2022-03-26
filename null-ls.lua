return function()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  local code_actions = null_ls.builtins.code_actions
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      -- Set code actions
      code_actions.gitsigns,
      code_actions.shellcheck,
      -- Set a formatter
      formatting.stylua,
      formatting.black,
      formatting.format_r,
      formatting.isort,
      formatting.prettier,
      formatting.shfmt,
      -- Set a linter
      diagnostics.cue_fmt,
      diagnostics.shellcheck,
    },
    -- NOTE: You can remove this on attach function to disable format on save
    on_attach = function(client)
      vim.notify(client.name, "info", { title = "Language Server", timeout = 500 })
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end
