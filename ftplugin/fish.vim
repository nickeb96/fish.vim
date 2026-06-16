" Vim filetype plugin file
" Language:     fish
" Maintainer:   Nicholas Boyle (github.com/nickeb96)
" Repository:   https://github.com/nickeb96/fish.vim
" Last Change:  2023 Feb 1
"               2023 Aug 28 by Vim Project (undo_ftplugin)
"               2024 May 23 by Riley Bruins <ribru17@gmail.com> ('commentstring')
"               2026 Mar 16 by Phạm Bình An (add matchit support)
"               2026 Jun 15 by Nicholas Boyle

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s:saved_cpo = &cpo
set cpo-=C

setlocal iskeyword=@,48-57,_,192-255,-,.
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal formatoptions+=crjq
setlocal formatoptions-=t

let b:undo_ftplugin = "setl isk< com< cms< fo<"

if get(g:, "fish_recommended_style", get(g:, "filetype_recommended_style", 0))
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal expandtab

    let b:undo_ftplugin ..= " ts< sw< sts< et<"
endif

if exists("&omnifunc")
  setlocal omnifunc=fishcomplete#Complete
  let b:undo_ftplugin ..= " ofu<"
endif

if exists("loaded_matchit") && !exists("b:match_words")
    let b:match_words =
        \ '\<\%(else\s\+\)\@<!if\>\|\<\%(switch\|begin\|function\|while\|for\)\>:' ..
        \ '\<else\%(\s\+if\)\?\>\|\<case\>:' ..
        \ '\<end\>'

    let b:match_ignorecase = 0
    let b:match_skip = "S:keyword"

    let b:undo_ftplugin ..= " | unlet! b:match_words b:match_ignorecase b:match_skip"
endif

let &cpo = s:saved_cpo
unlet s:saved_cpo
