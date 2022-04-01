function! fish#Indent()
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
        return indent(v:lnum) - l:shiftwidth
    elseif l:line =~# '^\s*else\>'
        return indent(v:lnum) - l:shiftwidth
    elseif l:line =~# '^\s*case\>'
        if l:prevline =~# '^\s*switch\>'
            return indent(v:lnum)
        else
            return indent(v:lnum) - l:shiftwidth
        endif
    endif
    return indent(l:prevlnum) + l:indent
endfunction
