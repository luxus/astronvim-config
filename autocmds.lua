return {
  setup = function()
    -- disable default terminal mappings
    vim.cmd "autocmd! TermMappings"

    -- Autocompiler
    vim.cmd [[
      augroup autocomp
        autocmd!
        autocmd VimLeave * !autocomp %:p stop
      augroup END
    ]]

    vim.cmd [[
      augroup dapui
        autocmd!
        autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<cr>
      augroup END
    ]]

    vim.cmd [[
      augroup mini
        autocmd!
        autocmd FileType * if index(['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'neo-tree', 'Trouble'], &ft) != -1 || index(['nofile', 'terminal', 'lsp-installer', 'lspinfo'], &bt) != -1 | let b:miniindentscope_disable=v:true | endif
      augroup END
    ]]
  end,
}
