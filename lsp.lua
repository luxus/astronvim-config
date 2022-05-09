return {
  servers = {
    "clangd",
    "cmake",
    "cssls",
    "html",
    "intelephense",
    "jsonls",
    "pyright",
    "sqls",
    "sumneko_lua",
    "texlab",
    "tsserver",
    "yamlls",
  },

  on_attach = function(client, bufnr)
    if client.name == "sqls" then
      require("sqls").on_attach(client, bufnr)
    end
  end,

  ["server-settings"] = {
    clangd = {
      capabilities = {
        offsetEncoding = "utf-8",
      },
    },
    texlab = {
      settings = {
        texlab = {
          build = {
            onSave = true,
          },
          forwardSearch = {
            executable = "zathura",
            args = { "--synctex-forward", "%l:1:%f", "%p" },
          },
        },
      },
    },
    yamlls = {
      settings = {
        yaml = {
          schemas = {
            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
          },
        },
      },
    },
  },
}
