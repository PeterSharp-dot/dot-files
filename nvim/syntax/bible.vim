"syntax case ignore

" Komentarze
syntax match bibleComment /\v#.*/
" Liczby
syntax match bibleNumber /\d\+/
" Słowa kluczowe
syntax keyword bibleConstant LORD Jesus
syntax keyword bibleTitle  Isaiah Jeremiah 
" Comments
syntax match bibleTag /comments:/


hi def link bibleComment Comment
hi def link bibleNumber String
hi def link bibleConstant Tag
hi def link bibleTag Tag
"hi def link bibleTitle LineNr
hi def link bibleTitle String
hi def link bibleSlash Search
