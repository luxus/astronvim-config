return function(client, bufnr)
  if client.name == "sqls" then
    require("sqls").on_attach(client, bufnr)
  elseif client.name == "r_language_server" and vim.o.filetype == "rmd" then
    client.resolved_capabilities.document_formatting = false
  end

  vim.notify(client.name, "info", { title = "Language Server", timeout = 500 })
end
