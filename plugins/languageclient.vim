" 言語ごとに設定する
let g:LanguageClient_serverCommands = {}
if executable('clangd')
    let g:LanguageClient_serverCommands['c'] = ['clangd']
    let g:LanguageClient_serverCommands['cpp'] = ['clangd']
endif

if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = ['pyls']
endif

if executable('css-languageserver')
    let g:LanguageClient_serverCommands['css'] = ['css-languageserver', '--stdio']
    let g:LanguageClient_serverCommands['scss'] = ['css-languageserver', '--stdio']
    let g:LanguageClient_serverCommands['sass'] = ['css-languageserver', '--stdio']
endif

" other settings
let g:LanguageClient_autoStart = 1

let g:LanguageClient_documentHighlightDisplay =
            \ {
            \     1: {
            \         "name": "Text",
            \         "texthl": "SpellRare",
            \     },
            \     2: {
            \         "name": "Read",
            \         "texthl": "MatchParen",
            \     },
            \     3: {
            \         "name": "Write",
            \         "texthl": "MatchParen",
            \     },
            \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

function! LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K    :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> <Leader>lh :call LanguageClient_textDocument_hover()<CR>
        nnoremap <silent> <Leader>ld :call LanguageClient_textDocument_definition()<CR>
        nnoremap <silent> <Leader>lr :call LanguageClient_textDocument_rename()<CR>
        nnoremap <silent> <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
    endif
endfunction

autocmd FileType * call LC_maps()

augroup lcHighlight
    autocmd!
    autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp call LanguageClient#textDocument_documentHighlight()
augroup END
