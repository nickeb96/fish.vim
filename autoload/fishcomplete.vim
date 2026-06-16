" Vim completion script
" Language:     fish
" Maintainer:   Nicholas Boyle (github.com/nickeb96)
" Repository:   https://github.com/nickeb96/fish.vim
" Last Change:	2026 Jun 15

function fishcomplete#Complete(findstart, base)
    if a:findstart == 1
        let l:preceding_text = strpart(getline('.'), 0, col('.') - 1)
        let l:reversed_match = match(reverse(l:preceding_text), "[ (){}[\\]'\"]")
        if l:reversed_match == -1
            return 0
        else
            let l:start_of_token = len(l:preceding_text) - l:reversed_match
            return l:start_of_token
        endif
    elseif a:findstart == 0
        let l:line = strpart(getline('.'), 0, col('.') - 1)
        let l:entries = s:completeFishCmd(l:line .. a:base)
        let l:complete_items = []
        for l:entry in l:entries
            let l:split_entry = split(l:entry, '\t')
            let l:item = {"word": l:split_entry[0], "menu": get(l:split_entry, 1, "")}
            call add(l:complete_items, l:item)
        endfor
        return l:complete_items
    endif
endfunction

function s:completeFishCmd(cmd)
    let l:completion_query = escape(escape(a:cmd, "'\\"), "\\")
    return systemlist("fish -c 'complete -C \\'" .. l:completion_query .. "\\''")
endfunction
