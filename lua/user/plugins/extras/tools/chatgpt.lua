local prefix = "<leader>G"
return {
  "jackMort/ChatGPT.nvim",
  keys = {
    { prefix, desc = "ChatGPT" },
    { prefix .. "c", "<cmd>ChatGPT<cr>", desc = "Talk to ChatGPT" },
    { prefix .. "e", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Edit selection" },
    { prefix .. "a", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPT act as" },
  },
  opts = {
    keymaps = {
      close = { "<C-c>", "<Esc>" },
      yank_last = "<C-y>",
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
      toggle_settings = "<C-o>",
      new_session = "<C-n>",
      cycle_windows = "<Tab>",
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
