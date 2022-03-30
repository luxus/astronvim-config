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
  end,
}
