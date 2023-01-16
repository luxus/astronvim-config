return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufEnter",
  opts = {
    provider_selector = function(_, filetype, buftype)
      if filetype == "" or buftype == "nofile" then
        return "indent"
      else
        return { "treesitter", "indent" }
      end
    end,
  },
  config = function(_, opts)
    require("ufo").setup(opts)
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
    vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek Fold" })
  end,
}
