-- This plugin is disabled by default,
-- Before enabling it, set environment variable called $OPENAI_API_KEY which you can optain here:
-- https://platform.openai.com/account/api-keys
return {
  "jackMort/ChatGPT.nvim",
  init = function() table.insert(astronvim.file_plugins, "ChatGPT.nvim") end,
  enabled = true,
  event = "VeryLazy",

  config = function()
    local prefix = "<leader>G"

    astronvim.set_mappings {
      n = {
        [prefix] = { name = "ChatGPT" },

        [prefix .. "c"] = { "<cmd>ChatGPT<cr>", desc = "Talk to ChatGPT" },
        [prefix .. "e"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = "ChatGPT edit selection" },
        [prefix .. "a"] = { "<cmd>ChatGPTActAs<cr>", desc = "ChatGPT act as" },
      },
    }

    require("chatgpt").setup {
      keymaps = {
        close = { "<C-c>", "<Esc>" },
        yank_last = "<C-y>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
        toggle_settings = "<C-o>",
        new_session = "<C-n>",
        cycle_windows = "<Tab>",
      },
    }
  end,
  depencencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
