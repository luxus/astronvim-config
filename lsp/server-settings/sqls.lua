return {
  on_attach = function(client, bufnr)
    if client.name == "sqls" then require("sqls").on_attach(client, bufnr) end
  end,
}
