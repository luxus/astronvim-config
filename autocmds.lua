vim.api.nvim_del_augroup_by_name "TermMappings"

vim.api.nvim_create_augroup("autocomp", {})
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler",
  group = "autocomp",
  pattern = "*",
  command = "!autocomp %:p stop",
})

vim.api.nvim_create_augroup("dapui", {})
vim.api.nvim_create_autocmd("FileType", {
  desc = "Make q close dap floating windows",
  group = "dapui",
  pattern = "dap-float",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close!<cr>")
  end,
})

vim.api.nvim_create_augroup("mini", {})
vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable indent scope for conent types",
  group = "mini",
  pattern = "*",
  command = "if index(['help', 'startify', 'alpha', 'packer', 'neogitstatus', 'NvimTree', 'neo-tree', 'Trouble'], &ft) != -1 || index(['nofile', 'terminal', 'lsp-installer', 'lspinfo'], &bt) != -1 | let b:miniindentscope_disable=v:true | endif",
})
