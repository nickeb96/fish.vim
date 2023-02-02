" Vim filetype detect file
" Language:     fish
" Maintainer:   Nicholas Boyle (github.com/nickeb96)
" Repository:   https://github.com/nickeb96/fish.vim
" Last Change:  February 1, 2023

autocmd BufRead,BufNewFile *.fish set filetype=fish

autocmd BufRead *
    \ if getline(1) =~# '^#!.\+\<fish\>' |
    \     setlocal filetype=fish |
    \ endif
