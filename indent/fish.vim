" Vim indent file
" Language:     fish
" Maintainer:   Nicholas Boyle (github.com/nickeb96)
" Repository:   https://github.com/nickeb96/fish.vim
" Last Change:  February 1, 2023

function! fish#Indent1()
    let l:shiftwidth = shiftwidth()
    let l:prevlnum = prevnonblank(v:lnum - 1)
    if l:prevlnum ==# 0
        return 0
    endif
    let l:prevline = getline(l:prevlnum)
    if l:prevline =~# '^\s*\(begin\|if\|else\|while\|for\|function\|case\|switch\)\>'
        let l:indent = l:shiftwidth
    else
        let l:indent = 0
    endif
    let l:line = getline(v:lnum)
    if l:line =~# '^\s*end\>'
        return indent(v:prevlnum) - l:shiftwidth
    elseif l:line =~# '^\s*else\>'
        return indent(l:prevlnum) - l:shiftwidth
    elseif l:line =~# '^\s*case\>'
        if l:prevline =~# '^\s*switch\>'
            return indent(v:lnum)
        else
            return indent(v:lnum) - l:shiftwidth
        endif
    endif
    return indent(l:prevlnum) + l:indent
endfunction


function! fish#PrevCmdStart(linenum)
    let l:linenum = a:linenum
    " look for the first line that isn't a line continuation
    while l:linenum > 1 && getline(l:linenum - 1) =~# '\\$'
        let l:linenum = l:linenum - 1
    endwhile
    return l:linenum
endfunction


function! fish#Indent()
    let l:shiftwidth = shiftwidth()

    let l:prevlnum = prevnonblank(v:lnum - 1)
    if l:prevlnum ==# 0
        return 0
    endif

    " if the previous line ended with a line continuation
    if getline(v:lnum - 1) =~# '\\$'
        if v:lnum ==# 0 || getline(v:lnum - 2) !~# '\\$'
            " this is the first line continuation in a chain, so indent it
            return indent(v:lnum - 1) + l:shiftwidth
        else
            " use the same indentation as the previous continued line
            return indent(v:lnum - 1)
        endif
    endif

    let l:prevlnum = fish#PrevCmdStart(l:prevlnum)

    let l:prevline = getline(l:prevlnum)
    if l:prevline =~# '^\s*\(begin\|if\|else\|while\|for\|function\|case\|switch\)\>'
        let l:indent = l:shiftwidth
    else
        let l:indent = 0
    endif

    let l:line = getline(v:lnum)
    if l:line =~# '^\s*end\>'
        " find end's matching start
        let l:depth = 1
        let l:currentlnum = v:lnum
        while l:depth > 0 && l:currentlnum > 0
            let l:currentlnum = fish#PrevCmdStart(prevnonblank(l:currentlnum - 1))
            let l:currentline = getline(l:currentlnum)
            if l:currentline =~# '^\s*end\>'
                let l:depth = l:depth + 1
            elseif l:currentline =~# '^\s*\(begin\|if\|while\|for\|function\|switch\)\>'
                let l:depth = l:depth - 1
            elseif
        endwhile
        if l:currentline =~# '^\s*switch\>'
            return indent(l:currentlnum)
        else
            return indent(l:prevlnum) + l:indent - l:shiftwidth
        endif
    elseif l:line =~# '^\s*else\>'
        return indent(l:prevlnum) + l:indent - l:shiftwidth
    elseif l:line =~# '^\s*case\>'
        if getline(l:prevlnum) =~# '^\s*switch\>'
            return indent(l:prevlnum) + l:indent
        else
            return indent(l:prevlnum) + l:indent - l:shiftwidth
        endif
    else
        return indent(l:prevlnum) + l:indent
    endif
endfunction
