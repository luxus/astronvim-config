return {
  setup = function()
    local map = vim.keymap.set
    local cmd = vim.api.nvim_create_autocmd
    local augroup = vim.api.nvim_create_augroup
    local del_augroup = vim.api.nvim_del_augroup_by_name

    del_augroup "TermMappings"

    augroup("autocomp", {})
    cmd("VimLeave", {
      desc = "Stop running auto compiler",
      group = "autocomp",
      pattern = "*",
      command = "!autocomp %:p stop",
    })

    augroup("dapui", {})
    cmd("FileType", {
      desc = "Make q close dap floating windows",
      group = "dapui",
      pattern = "dap-float",
      callback = function()
        map("n", "q", "<cmd>close!<cr>")
      end,
    })

    augroup("mini", {})
    cmd("FileType", {
      desc = "Disable indent scope for conent types",
      group = "mini",
      pattern = "*",
      command = "if index(['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'neo-tree', 'Trouble'], &ft) != -1 || index(['nofile', 'terminal', 'lsp-installer', 'lspinfo'], &bt) != -1 | let b:miniindentscope_disable=v:true | endif",
    })
  end,
}
