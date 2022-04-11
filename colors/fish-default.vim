set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "fish-default"

hi LineNr                       ctermfg=0 ctermbg=8
hi NonText                      ctermfg=8

" these values come from fish_color_selection, but it's not possible to create
" a highlight link from fish_color_selection to Visual
hi Visual                       ctermfg=7 ctermbg=8 cterm=bold guifg=#c5c8c6 guibg=#666666 gui=bold
hi Pmenu                        ctermfg=7 ctermbg=NONE guifg=#c8c8c8 guibg=NONE
hi PmenuSel                     ctermfg=7 ctermbg=8 cterm=bold guifg=#c8c8c8 guibg=#444444 gui=bold

hi fish_color_command           ctermfg=4 guifg=#81a2be
hi fish_color_comment           ctermfg=1 cterm=italic guifg=#cc6666 gui=italic
hi fish_color_end               ctermfg=2 guifg=#b5bd68
hi fish_color_escape            ctermfg=14 guifg=#70c0b1
hi fish_color_keyword           ctermfg=4 guifg=#81a2be
hi fish_color_normal            ctermfg=7 guifg=#c5c8c6
hi fish_color_operator          ctermfg=14 guifg=#70c0b1
hi fish_color_option            ctermfg=6 guifg=#8abeb7
hi fish_color_param             ctermfg=6 guifg=#8abeb7
hi fish_color_quote             ctermfg=3 guifg=#f0c674
hi fish_color_redirection       ctermfg=6 cterm=bold guifg=#8abeb7 gui=bold

