augroup fileType
  au!
  au BufRead            *.cls     set      ft=tex
  au FileType           python    setlocal foldmethod=indent
  au FileType           c,cpp     setlocal foldmethod=indent
  au FileType           go        setlocal tabstop=4 shiftwidth=4 noexpandtab | set formatoptions+=r
  au FileType           tex       setlocal tabstop=4 shiftwidth=4 foldmethod=syntax spell
  au FileType           tex       imap     <buffer> ( (
  au FileType           tex       imap     <buffer> { {
  au FileType           tex       imap     <buffer> [ [
  au FileType           html      setlocal nowrap
  au FileType           csv       setlocal nowrap
  au FileType           tsv       setlocal nowrap
  au FileType           text      setlocal noet spell
  au FileType           mail      setlocal noet spell
  au FileType           gitcommit setlocal spell
  au FileType           markdown  setlocal noet spell
  au BufNewFile,BufRead *.grg     setlocal nowrap
  au BufNewFile,BufRead *.jl      setf     julia
  au BufNewFile,BufRead *.pxv     setf     pixiv
  au filetype           help      setlocal spell noet
augroup END

augroup localleader
    autocmd!
    autocmd FileType tex    map <buffer> <localleader>s <plug>(vimtex-env-toggle-star)
    autocmd FileType tex    map <buffer> <localleader>t <plug>(vimtex-toc-toggle)
    autocmd FileType tex    map <buffer> <localleader>e <plug>(vimtex-env-change)
    autocmd FileType tex    map <buffer> <localleader>d <plug>(vimtex-delim-toggle-modifier)
    autocmd FileType python map <buffer> <localleader>r :%AsyncRun python<CR>
    autocmd FileType ruby map <buffer> <localleader>r :%AsyncRun ruby<CR>
augroup END

augroup Binary
    au!
    au BufReadPre  *.bin setlocal bin
    au BufReadPre  *.img setlocal bin
    au BufReadPre  *.sys setlocal bin
    au BufReadPre  *.torrent setlocal bin
    au BufReadPre  *.out setlocal bin
    au BufReadPre  *.a setlocal bin

    au BufReadPost * if &bin | %!xxd
    au BufReadPost * setlocal ft=xxd | endif

    au BufWritePre * if &bin | %!xxd -r
    au BufWritePre * endif

    au BufWritePost * if &bin | %!xxd
    au BufWritePost * set nomod | endif
augroup END

augroup CSV_TSV
    au!
    au BufReadPost,BufWritePost *.csv %!column -s, -o, -t
    au BufWritePre              *.csv %s/\s\+,/,/ge
    au BufReadPost,BufWritePost *.tsv %!column -s "$(printf '\t')" -o "$(printf '\t')" -t
    au BufWritePre              *.tsv %s/ \+	/	/ge
augroup END

augroup JupyterNotebook
    au!
    au BufReadPost *.ipynb %!jupytext --from ipynb --to py:percent
    au BufWritePre *.ipynb let g:jupyter_previous_location = getpos('.')
    au BufWritePre *.ipynb %!jupytext --from py:percent --to ipynb
    au BufWritePost *.ipynb %!jupytext --from ipynb --to py:percent 
    au BufWritePost *.ipynb if exists('g:jupyter_previous_location') | call setpos('.', g:jupyter_previous_location) | endif
augroup END

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup limitlento80
    autocmd!
    " autocmd Filetype tex,gitcommit execute "set colorcolumn=" . join(range(81,335), ',')
    " autocmd Filetype tex,gitcommit hi ColorColumn cterm=NONE ctermbg=251 ctermfg=237 guibg=#cad0de guifg=#576a9e
augroup end
