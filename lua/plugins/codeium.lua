-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {

  -- codeium
  {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    event = "InsertEnter",
    build = ":Codeium Auth",
    opts = {
      enable_cmp_source = true,
      virtual_text = {
        enabled = false,
        key_bindings = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },

  -- add ai_accept action
  -- {
  --   "Exafunction/codeium.nvim",
  --   opts = function()
  --     local CREATE_UNDO = vim.api.nvim_replace_termcodes("<c-G>u", true, true, true)
  --     local function create_undo()
  --       if vim.api.nvim_get_mode().mode == "i" then vim.api.nvim_feedkeys(CREATE_UNDO, "n", false) end
  --     end
  --     LazyVim.cmp.actions.ai_accept = function()
  --       if require("codeium.virtual_text").get_current_completion_item() then
  --         vim.api.nvim_input(require("codeium.virtual_text").accept())
  --         return true
  --       end
  --     end
  --   end,
  -- },

  -- codeium cmp source
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = { "codeium.nvim" },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },

  {
    "saghen/blink.cmp",
    optional = true,
    version = "*",
    dependencies = { "codeium.nvim", { "saghen/blink.compat", opts = { enable_events = true } } },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "codeium" },
        providers = {
          codeium = {
            name = "codeium",
            score_offset = 100,
            async = true,
            module = "blink.compat.source",
          },
        },
      },
    },
  },
}
