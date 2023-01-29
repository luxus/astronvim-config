return {
  -- noicer ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    -- enabled = false,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      messages = { enabled = false },
      presets = {
        inc_rename = true,
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = "rounded",
      },
    },
  },
}
