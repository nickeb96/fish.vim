if exists("b:current_syntax")
    finish
endif


syn keyword fishKeywordAcceptsAnother while command builtin skipwhite nextgroup=fishStatement,fishKeywordAcceptsAnother,fishOperator,fishVariable,fishCommandSub
syn keyword fishForFor for skipwhite nextgroup=fishForVariable
syn match fishForVariable /[[:alnum:]_-]\+/ contained skipwhite nextgroup=fishForIn
syn keyword fishForIn in contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn keyword fishKeyword _ argparse begin bg bind block break breakpoint case
    \ cd commandline complete \contains continue count disown echo emit end eval
    \ exec exit false fg function functions history jobs math printf pwd random
    \ read realpath return set set_color source status string switch test time
    \ true type ulimit wait
    \ skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn keyword fishKeywordIf if skipwhite nextgroup=fishStatement,fishKeyword,fishKeywordAcceptsAnother,fishEscapeNl,fishOperator,fishVariable,fishCommandSub
syn keyword fishKeywordElse else skipwhite nextgroup=fishKeywordIf
syn match fishStatement /[[:alnum:]_\[][[:alnum:]+._-]*/ skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishArgument '[[:alnum:]\u5b\u5d@:=+.,%/_-]\+' contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishOption /-[[:alnum:]=_-]*/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishEscapeNl /\\$/ skipnl skipwhite contained nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn region fishQuote start=/'/ skip=/\\'/ end=/'/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn region fishQuote start=/"/ skip=/\\"/ end=/"/ contains=fishInnerVariable,fishInnerCommandSub contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\[01234567abefnrtv\[\](){}<>*?~%#$|&;'" ]/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\c[a-z]/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\u[0-9a-fA-F]\{4}/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\U[0-9a-fA-F]\{8}/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\0[0-7]\{1,2}/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\x[0-7][0-9a-fA-F]\|\\x[0-9a-fA-F]/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishChar /\\X[0-9a-fA-F]\{1,2}/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishVariable /\$\+[[:alnum:]_-]\+/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishInnerVariable /\$\+[[:alnum:]_-]\+/ contained
syn match fishRedirection /\(0\|1\|2\|&\)\?\(<\|>\|>>\|>?\)\([[:alnum:]~\/._-]\+\|&0\|&1\|&2\)/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar
syn match fishPathGlob /\(\~\|*\|?\)/ contained skipwhite nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar

syn match fishTerminator /\(;\||\|&\)/
syn match fishOperator /\(&&\|||\|!\|and\|or\|not\)/
syn match fishComment /#.*/

syn region fishCommandSub start=/\$\?(/ end=/)/ matchgroup=fishCommandSubParenthesis skipwhite contains=fishStatement,fishKeyword,fishKeywordAcceptsAnother,fishTerminator,fishOperator,fishEscapeNl,fishChar
    \ nextgroup=fishArgument,fishOption,fishQuote,fishVariable,fishRedirection,fishPathGlob,fishCommandSub,fishEscapeNl,fishChar

syn region fishInnerCommandSub start=/\$(/ end=/)/ matchgroup=fishCommandSubParenthesis skipwhite contains=fishStatement,fishKeyword,fishKeywordAcceptsAnother,fishTerminator,fishOperator,fishEscapeNl,fishChar


" Intermediate highlight groups matching fish_color_* variables

hi def link fishStatement               fish_color_command
hi def link fishComment                 fish_color_comment
hi def link fishTerminator              fish_color_end
hi def link fishChar                    fish_color_escape
hi def link fishKeyword                 fish_color_keyword
hi def link fishKeywordAcceptsAnother   fish_color_keyword
hi def link fishKeywordIf               fish_color_keyword
hi def link fishKeywordElse             fish_color_keyword
hi def link fishForFor                  fish_color_keyword
hi def link fishForIn                   fish_color_keyword
hi def link fishEscapeNl                fish_color_normal
hi def link fishOperator                fish_color_operator
hi def link fishCommandSub              fish_color_operator
hi def link fishInnerCommandSub         fish_color_operator
hi def link fishVariable                fish_color_operator
hi def link fishInnerVariable           fish_color_operator
hi def link fishPathGlob                fish_color_operator
hi def link fishOption                  fish_color_option
hi def link fishArgument                fish_color_param
hi def link fishForVariable             fish_color_param
hi def link fishQuote                   fish_color_quote
hi def link fishRedirection             fish_color_redirection


" Default highlight groups 

hi def link fish_color_param        Normal
hi def link fish_color_normal       Normal
hi def link fish_color_option       Normal
hi def link fish_color_command      Function
hi def link fish_color_keyword      Keyword
hi def link fish_color_end          Delimiter
hi def link fish_color_operator     Operator
hi def link fish_color_redirection  Type
hi def link fish_color_quote        String
hi def link fish_color_escape       Character
hi def link fish_color_comment      Comment


let b:current_syntax = 'fish'
