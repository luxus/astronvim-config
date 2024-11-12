-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<C-a>"] = { "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion actions" },
              ["<Leader>a"] = { "<cmd>CodeCompanionToggle<cr>", desc = "CodeCompanion toggle" },
            },
            v = {
              ["<C-a>"] = { "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion actions" },
              ["<Leader>a"] = { "<cmd>CodeCompanionToggle<cr>", desc = "CodeCompanion toggle" },
              ["ga"] = { "<cmd>CodeCompanionAdd<cr>", desc = "CodeCompanion add" },
            },
          },
        },
      },
    },
    specs = {
      { "nvim-telescope/telescope.nvim", optional = true },
      { "hrsh7th/nvim-cmp", optional = true },
      { "stevearc/dressing.nvim", optional = true },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "anthropic",
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "fzf_lua", -- default|telescope|fzf_lua
              },
            },
            ["buffer"] = {
              opts = {
                provider = "fzf_lua", -- default|telescope|fzf_lua
              },
            },
          },
        },
        inline = {
          adapter = "anthropic",
        },
        agent = {
          adapter = "anthropic",
        },
      },
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:op read op://Private/Anthropic/api-nvim --no-newline",
            },
          })
        end,
      },
    },
    cmd = { "CodeCompanionToggle", "CodeCompanionAdd", "CodeCompanionActions", "CodeCompanion" },
  },
  -- {
  --   "rebelot/heirline.nvim",
  --   opts = function(_, opts)
  --     local status = require "astroui.status"
  --
  --     -- Define the CodeCompanion logic
  --     local CodeCompanion = {
  --       static = {
  --         processing = false,
  --       },
  --       update = {
  --         "User",
  --         pattern = "CodeCompanionRequest*",
  --         callback = function(self, args)
  --           if args.match == "CodeCompanionRequestStarted" then
  --             self.processing = true
  --           elseif args.match == "CodeCompanionRequestFinished" then
  --             self.processing = false
  --           end
  --           vim.cmd "redrawstatus"
  --         end,
  --       },
  --     }
  --
  --     -- Function to get the status
  --     local function get_code_companion_status() return CodeCompanion.static.processing end
  --
  --     -- Integrate into heirline.nvim configuration
  --     table.insert(
  --       opts.statusline,
  --       10,
  --       status.component.builder {
  --         {
  --           provider = function()
  --             local processing = get_code_companion_status()
  --             return status.utils.stylize(processing and "" or "", { padding = { right = 1 } })
  --           end,
  --         },
  --         hl = { fg = "git_branch_fg" },
  --         surround = {
  --           separator = "right",
  --           color = "section_bg",
  --           condition = function() return true end, -- Always show the status
  --         },
  --       }
  --     )
  --   end,
  -- },
}
