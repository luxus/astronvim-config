return function(client, bufnr)
  if client.server_capabilities.codeLensProvider then
    local group_name = "codelens_" .. bufnr
    vim.api.nvim_create_augroup(group_name, { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      group = group_name,
      callback = function() vim.lsp.codelens.refresh() end,
      buffer = bufnr,
    })
  end
end
