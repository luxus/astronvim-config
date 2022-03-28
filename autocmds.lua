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

    -- Mutt Emails
    vim.cmd [[
      augroup mutt
        autocmd BufNewFile,BufFilePre,BufRead /tmp/neomutt* set filetype=markdown
      augroup END
    ]]

    vim.cmd [[
      augroup rmd
        autocmd BufNewFile,BufFilePre,BufRead *.rmd set filetype=markdown
      augroup END
    ]]

    vim.cmd [[
      autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<cr>
    ]]
  end,
}
