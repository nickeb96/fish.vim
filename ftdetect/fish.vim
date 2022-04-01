autocmd BufRead,BufNewFile *.fish set filetype=fish

autocmd BufRead *
    \ if getline(1) =~# '^#!.\+\<fish\>' |
    \     setlocal filetype=fish |
    \ endif
