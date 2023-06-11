"syntax case ignore

" Komentarze
syntax match bibleComment /\v#.*/
" Liczby
syntax match bibleNumber /\d\+/
" Słowa kluczowe
syntax keyword bibleConstant LORD Jesus
syntax keyword bibleTitle  Isaiah Jeremiah Genesis Exodus Leviticus Numbers Deuteronomium Jozue Judges 
" Comments
syntax match bibleTag /comments:/
syntax match cBracket /\[.*\]/
"syntax match Todo /\[/ conceal
"syntax match Todo /\]/ conceal


hi def link bibleComment Comment
hi def link bibleNumber String
hi def link bibleConstant Tag
hi def link bibleTag Tag
"hi def link bibleTitle LineNr
hi def link bibleTitle String
hi def link bibleSlash Search
hi def link cBracket Label
