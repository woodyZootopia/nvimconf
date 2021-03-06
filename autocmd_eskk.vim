autocmd User eskk-enable-post call s:eskk_enable_post()
function! s:eskk_enable_post()
    EskkMap -force <C-n> <Down>
    EskkMap -force <C-p> <Up>
    EskkMap -force <C-a> <Home>
    EskkMap -force <C-e> <End>
endfunction

let g:eskk_autoenable=1
nnoremap <silent><expr> <F2> <SID>markdown_eskk_toggle()

augroup eskk_autoenable
    autocmd!
    autocmd InsertEnter *.md,*.pxv,*.ltx if g:eskk_autoenable | call eskk#enable() | endif
    " autocmd FileType markdown,pixiv nnoremap <buffer><silent><expr> <F2> <SID>markdown_eskk_toggle()
augroup END

function! s:markdown_eskk_toggle() abort
  let g:eskk_autoenable = g:eskk_autoenable == 1 ? 0 : 1
  if g:eskk_autoenable ==# 1
    echomsg '日本語入力モードON'
  else
    echomsg '日本語入力モードOFF'
  endif
endfunction

autocmd User eskk-initialize-pre call s:eskk_initial_pre()
  function! s:eskk_initial_pre()
    " hira
    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
    call t.add_map('~', '～')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('tm', '™')
    call t.add_map('z ', '　')
    call t.add_map("'", 'っ')
    call t.add_map('!', '！')
    call t.add_map('zm', '……')
    call t.add_map('zd', '――')
    call t.add_map('(', '（')
    call t.add_map(')', '）')
    call t.add_map('xn', 'ん')
    call t.add_map('bja', 'びゃ')
    call t.add_map('bje', 'びぇ')
    call t.add_map('bji', 'びぃ')
    call t.add_map('bjo', 'びょ')
    call t.add_map('bju', 'びゅ')
    call t.add_map('cja', 'ちゃ')
    call t.add_map('cje', 'ちぇ')
    call t.add_map('cji', 'ちぃ')
    call t.add_map('cjo', 'ちょ')
    call t.add_map('cju', 'ちゅ')
    call t.add_map('dja', 'ぢゃ')
    call t.add_map('dje', 'ぢぇ')
    call t.add_map('dji', 'ぢぃ')
    call t.add_map('djo', 'ぢょ')
    call t.add_map('dju', 'ぢゅ')
    call t.add_map('fja', 'ふゃ')
    call t.add_map('fje', 'ふぇ')
    call t.add_map('fji', 'ふぃ')
    call t.add_map('fjo', 'ふょ')
    call t.add_map('fju', 'ふゅ')
    call t.add_map('gja', 'ぎゃ')
    call t.add_map('gje', 'ぎぇ')
    call t.add_map('gji', 'ぎぃ')
    call t.add_map('gjo', 'ぎょ')
    call t.add_map('gju', 'ぎゅ')
    call t.add_map('hja', 'ひゃ')
    call t.add_map('hje', 'ひぇ')
    call t.add_map('hji', 'ひぃ')
    call t.add_map('hjo', 'ひょ')
    call t.add_map('hju', 'ひゅ')
    call t.add_map('kja', 'きゃ')
    call t.add_map('kje', 'きぇ')
    call t.add_map('kji', 'きぃ')
    call t.add_map('kjo', 'きょ')
    call t.add_map('kju', 'きゅ')
    call t.add_map('mja', 'みゃ')
    call t.add_map('mje', 'みぇ')
    call t.add_map('mji', 'みぃ')
    call t.add_map('mjo', 'みょ')
    call t.add_map('mju', 'みゅ')
    call t.add_map('nja', 'にゃ')
    call t.add_map('nje', 'にぇ')
    call t.add_map('nji', 'にぃ')
    call t.add_map('njo', 'にょ')
    call t.add_map('nju', 'にゅ')
    call t.add_map('pja', 'ぴゃ')
    call t.add_map('pje', 'ぴぇ')
    call t.add_map('pji', 'ぴぃ')
    call t.add_map('pjo', 'ぴょ')
    call t.add_map('pju', 'ぴゅ')
    call t.add_map('rja', 'りゃ')
    call t.add_map('rje', 'りぇ')
    call t.add_map('rji', 'りぃ')
    call t.add_map('rjo', 'りょ')
    call t.add_map('rju', 'りゅ')
    call t.add_map('tja', 'ちゃ')
    call t.add_map('tje', 'ちぇ')
    call t.add_map('tji', 'ちぃ')
    call t.add_map('tjo', 'ちょ')
    call t.add_map('tju', 'ちゅ')
    call eskk#register_mode_table('hira', t)
endfunction
