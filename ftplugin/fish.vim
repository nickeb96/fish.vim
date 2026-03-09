" Vim filetype plugin file
" Language:     fish
" Maintainer:   Nicholas Boyle (github.com/nickeb96)
" Repository:   https://github.com/nickeb96/fish.vim
" Last Change:  February 1, 2023

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal iskeyword=@,48-57,_,192-255,-,.
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal formatoptions+=crjq

let b:undo_ftplugin = "setl cms< com< fo< isk<"

let b:match_words = '\<\%(else\s\+\)\@<!if\>\|\<\%(begin\|function\|switch\|while\|for\)\>' .
                  \ ':\<else\s\+if\>\|\<else\>\|\<case\>' .
                  \ ':\<end\>'
