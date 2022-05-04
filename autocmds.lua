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
  callback = function()
    if
      vim.tbl_contains({
        "NvimTree",
        "TelescopePrompt",
        "Trouble",
        "alpha",
        "help",
        "lsp-installer",
        "lspinfo",
        "neo-tree",
        "neogitstatus",
        "packer",
        "startify",
      }, vim.bo.filetype) or vim.tbl_contains({ "nofile", "terminal" }, vim.bo.buftype)
    then
      vim.b.miniindentscope_disable = true
    end
  end,
})
