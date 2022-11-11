vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler",
  group = vim.api.nvim_create_augroup("autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Make q close dap floating windows",
  group = vim.api.nvim_create_augroup("dapui", { clear = true }),
  pattern = "dap-float",
  callback = function() vim.keymap.set("n", "q", "<cmd>close!<cr>") end,
})
