return {
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    init = function()
      vim.diagnostic.config {
        --FIX: the next line is getting overwritten somewhere else
        virtual_text = false,
        virtual_lines = false,
      }
    end,
    config = true,
    keys = {
      {
        "<leader>v",
        "<cmd>lua require('lsp_lines').toggle()<CR>",
        desc = "LSP Lines",
      },
    },
  },
}
