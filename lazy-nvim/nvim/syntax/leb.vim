"syntax case ignore
" Komentarze
"syntax match bibleComment /\v#.*/
syntax match bibleComment /\(#\)\@<=.*/ 
" Liczby
syntax match bibleNumber /\d\+/

"Poniższe ustawienia dla kolorów linków do plików
syntax match lebPath /\.\/[a-zA-Z0-9_\/\.\-]*/
" highlight link lebPath Underlined
highlight lebPath2 guibg=NONE guifg=#1886b5 gui=underline

syntax match lebPath2 /\$NOTES\/[a-zA-Z0-9_\/\.\-]*/
" highlight link lebPath2 Underlined
highlight lebPath2 guibg=NONE guifg=#1886b5 gui=underline

" " Comments
syntax match bibleTag /\.\/comments\:/
"syntax match cBracket /\[.*\]/
" \(foo \)\@<=bar\\( baz\)\@=  -ten kod to tzw. lookaround, czyli sukces gdy
" bar jest pomiędzy foo i baz, ale wyodrębnione jest tylko samo bar
" syntax match squereBracket /\(\[\)\@<=.*\(\]\)\@=/
syntax match tyldeBracket /\(\`\)\@<=.*\(\`\)\@=/
syntax match astericBold /\(\*\*\)\@<=.*\(\*\*\)\@=/
" syntax match lebSpecial /\(\<\)\@<=.*\(\>\)\@=/
" syntax match lebSpecial /<[^>]*>/
syntax region lebSpecial start=+<+ end=+>+ contains=@Spell
"syntax match astericItalic /\(\*\)\@<=.*\(*\)\@=/
syntax match floorUnderline /\(_\)\@<=.*\(_\)\@=/
" aby to poniższe działało musi być autokomenda w init.vim, którą tam już
" umieściłem
" syntax match Todo /\[/ conceal
" syntax match Todo /\]/ conceal
" syntax match Todo /{/ conceal
" syntax match Todo /}/ conceal
syntax match Todo /\`/ conceal
" syntax match Todo /\</ conceal
" syntax match Todo /\>/ conceal
syntax match Todo /\*\*/ conceal
syntax match Todo /_/ conceal
syntax match Todo /#/ conceal


hi def link bibleComment Title
hi bibleNumber guibg=NONE guifg=#495e61 gui=italic
hi def link bibleConstant Tag
hi link bibleTag Underlined
"hi def link bibleTitle LineNr
hi def link bibleTitle String
hi def link bibleTitle2 String
hi def link bibleSlash Search
"hi def link cBracket Label
hi def link squereBracket Tag
highlight tyldeBracket guibg=NONE guifg=NONE gui=italic
hi def link astericBold Title
"hi def link astericItalic Comment
hi def link floorUnderline Underlined
highlight lebSpecial guibg=NONE guifg=#524c6b gui=italic
