if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "GeorgesAlkhouri/nvim-aider",
  cmd = {
    "AiderTerminalToggle",
    "AiderHealth",
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>a"
        maps.n[prefix .. "<space>"] = { "<cmd>AiderTerminalToggle<CR>", desc = "Aider: Toggle" }
        maps.n[prefix .. "h"] = { "<cmd>AiderHealth<CR>", desc = "Aider: Health" }
        maps.n[prefix .. "s"] = { "<cmd>AiderTerminalSend<CR>", desc = "Aider: Send" }
        maps.v[prefix .. "s"] = { "<cmd>AiderTerminalSend<CR>", desc = "Aider: Send" }
        maps.n[prefix .. "b"] = { "<cmd>AiderQuickSendBuffer<CR>", desc = "Aider: Send buffer" }
        maps.n[prefix .. "c"] = { "<cmd>AiderQuickSendCommand<CR>", desc = "Aider: Send command" }
        maps.n[prefix .. "+"] = { "<cmd>AiderQuickAddFile<CR>", desc = "Aider: Add file" }
        maps.n[prefix .. "-"] = { "<cmd>AiderQuickDropFile<CR>", desc = "Aider: Drop file" }
        maps.n[prefix .. "r"] = { "<cmd>AiderQuickReadOnlyFile<CR>", desc = "Aider: Add file (readonly) " }
      end,
    },
  },
  opts = {
    theme = {
      user_input_color = "#72a072", -- dragonGreen - Bright green for user input
      tool_output_color = "#698a9b", -- crystalBlue - Cool blue for tool output
      tool_error_color = "#c4746e", -- autumnRed - Bold red for errors
      tool_warning_color = "#d4c196", -- carpYellow - Strong yellow for warnings
      assistant_output_color = "#b4a7b5", -- oniViolet - Gentle purple for assistant
      completion_menu_color = "#dcd7ba", -- Foreground - Light text for menu (matches theme foreground)
      completion_menu_bg_color = "#393836", -- sumiInk5 - Dark background for menu
      completion_menu_current_color = "#1f1f28", -- Background - Matches theme bg
      completion_menu_current_bg_color = "#8ea49e", -- waveAqua1 - Highlighted item
    },
  },
}
