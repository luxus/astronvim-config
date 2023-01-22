return {

  -- extend auto completion
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "Saecki/crates.nvim",
  --       event = { "BufRead Cargo.toml" },
  --       config = true,
  --     },
  --   },
  --   opts = function(_, opts)
  --     local cmp = require "cmp"
  --     return astronvim.extend_tbl(opts, {
  --       sources = cmp.config.sources {
  --         { name = "crates", priority = 750 },
  --       },
  --     })
  --   end,
  -- },

  -- add rust to treesitter
  --
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "rust", "toml" },
    },
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = {
      "codelldb",
    } },
  },
  {
    "simrat39/rust-tools.nvim", -- add lsp plugin
    -- dependencies = {
    --   "williamboman/mason-lspconfig.nvim",
    --   opts = {
    --     ensure_installed = { "taplo", "rust_analyzer" },
    --   },
    -- },
  },

  -- correctly setup lspconfig for Rust 🚀
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = { "simrat39/rust-tools.nvim" },
  --   opts = {
  --     -- make sure mason installs the server
  --     setup = {
  --       rust_analyzer = function(_, opts)
  --         require("lazyvim.util").on_attach(function(client, buffer)
  --           -- stylua: ignore
  --           if client.name == "rust_analyzer" then
  --             vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { buffer = buffer, desc = "Hover Actions (Rust)" })
  -- 	  vim.keymap.set("n", "<leader>cR", "<cmd>RustCodeAction<cr>", { buffer = buffer, desc = "Code Action (Rust)" })
  --           end
  --         end)
  --         local mason_registry = require "mason-registry"
  --         -- rust tools configuration for debugging support
  --         local codelldb = mason_registry.get_package "codelldb"
  --         local extension_path = codelldb:get_install_path() .. "/extension/"
  --         local codelldb_path = extension_path .. "adapter/codelldb"
  --         local liblldb_path = vim.fn.has "mac" == 1 and extension_path .. "lldb/lib/liblldb.dylib"
  --           or extension_path .. "lldb/lib/liblldb.so"
  --         local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
  --           dap = {
  --             adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  --           },
  --           server = {
  --             settings = {
  --               ["rust-analyzer"] = {
  --                 cargo = {
  --                   allFeatures = true,
  --                   loadOutDirsFromCheck = true,
  --                   runBuildScripts = true,
  --                 },
  --                 -- Add clippy lints for Rust.
  --                 checkOnSave = {
  --                   allFeatures = true,
  --                   command = "clippy",
  --                   extraArgs = { "--no-deps" },
  --                 },
  --                 procMacro = {
  --                   enable = true,
  --                   ignored = {
  --                     ["async-trait"] = { "async_trait" },
  --                     ["napi-derive"] = { "napi" },
  --                     ["async-recursion"] = { "async_recursion" },
  --                   },
  --                 },
  --               },
  --             },
  --           },
  --         })
  --         require("rust-tools").setup(rust_tools_opts)
  --         return true
  --       end,
  --       taplo = function(_, _)
  --         local function show_documentation()
  --           if vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
  --             require("crates").show_popup()
  --           else
  --             vim.lsp.buf.hover()
  --           end
  --         end
  --         require("lazyvim.util").on_attach(function(client, buffer)
  --           -- stylua: ignore
  --           if client.name == "taplo" then
  --             vim.keymap.set("n", "K", show_documentation, { buffer = buffer, desc = "Show Crate Documentation" })
  --           end
  --         end)
  --         return false -- make sure the base implementation calls taplo.setup
  --       end,
  --     },
  --   },
  -- },
}
