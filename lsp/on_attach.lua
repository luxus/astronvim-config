return function(client, bufnr)
  if client.name == "sqls" then
    require("sqls").on_attach(client, bufnr)
  end

  vim.notify(client.name, "info", { title = "Language Server" })
end
