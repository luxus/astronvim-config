return {
  setup = function()
    -- disable default terminal mappings
    vim.cmd "autocmd! TermMappings"

    -- Autocompiler
    vim.cmd [[
      augroup autocomp
        autocmd VimLeave * !autocomp %:p stop
      augroup END
    ]]

    vim.cmd [[
      autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<cr>
    ]]
  end,
}
