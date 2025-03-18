return {
  "olimorris/codecompanion.nvim",
  cmd = { "CodeCompanionChat", "CodeCompanion", "CodeCompanionActions", "CodeCompanionCmd" },
  dependencies = {
    {
      "blink.cmp",
      optional = true,
      opts = {
        sources = {
          per_filetype = {
            codecompanion = { "codecompanion" },
          },
        },
      },
    },
    "nvim-treesitter/nvim-treesitter",
    {
      "ravitemer/mcphub.nvim",
      cmd = "MCPHub",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "bun install -g mcp-hub@latest", -- Installs required mcp-hub npm module
      opts = {
        -- Required options
        port = 3000, -- Port for MCP Hub server
        config = vim.fn.expand "~/mcpservers.json", -- Absolute path to config file
        -- Optional options
        on_ready = function(hub)
          -- Called when hub is ready
        end,
        on_error = function(err)
          -- Called on errors
        end,
        shutdown_delay = 0, -- Wait 0ms before shutting down server after last client exits
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = "MCPHub",
        },
      },
    },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>a"
        maps.n[prefix] = { desc = " AI" }
        maps.v[prefix] = { desc = " AI" }
        maps.n[prefix .. "m"] = { "<cmd>MCPHub<CR>", desc = "MCP Hub" }
        maps.n[prefix .. "a"] = { "<cmd>CodeCompanionActions<CR>", desc = "CC Actions" }
        maps.v[prefix .. "a"] = { "<cmd>CodeCompanionActions<CR>", desc = "CC Actions" }
        maps.n[prefix .. "A"] = { "<cmd>CodeCompanionChat Toggle<CR>", desc = "CC Chat" }
        maps.v[prefix .. "A"] = { "<cmd>CodeCompanionChat Toggle<CR>", desc = "CC Chat" }
        maps.n[prefix .. "m"] = { "<cmd>MCPHub<CR>", desc = "MCP Hub" }
        maps.v["ga"] = { "<cmd>CodeCompanionChat Add<CR>", desc = "Add file to CC" }
      end,
    },
  },
  config = function()
    local opts = {
      strategies = {
        chat = {
          -- adapter = "anthropic",
          adapter = "qwq",
          tools = {
            ["mcp"] = {
              -- callback = function()
              -- 	return require("mcphub.extensions.codecompanion")
              -- end,
              -- FIXED: Should only be called in config function
              callback = require "mcphub.extensions.codecompanion",
              description = "Call tools and resources from the MCP Servers",
              opts = {
                requires_approval = true,
              },
            },
          },
          inline = {
            adapter = "anthropic",
          },
        },
      },
      adapters = {
        qwq = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwq",
            env = { url = "http://192.168.178.71:11434" },
            schema = {
              model = {
                default = "qwq:latest",
              },
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
    }
    require("codecompanion").setup(opts)
  end,
}
