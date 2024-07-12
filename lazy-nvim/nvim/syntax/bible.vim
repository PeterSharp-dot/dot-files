"syntax case ignore

" Komentarze
"syntax match bibleComment /\v#.*/
syntax match bibleComment /\(#\)\@<=.*/ 
" Liczby
syntax match bibleNumber /\d\+/
" Słowa kluczowe
"syntax keyword bibleConstant LORD Jesus
"syntax keyword bibleTitle  Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth Samuel  Kings Chronicles Ezra Nehemiah Esther Job Psalms Proverbs Ecclesiastes Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans Corinthians Galatians Ephesians Philippians Colossian Thessalonians Timothy Titus Philemon Hebrews James Peter John Jude Revelation.
"syntax match bibleTitle2 /Song of Solomon/
" Comments
syntax match bibleTag /comments:/
"syntax match cBracket /\[.*\]/
" \(foo \)\@<=bar\\( baz\)\@=  -ten kod to tzw. lookaround, czyli sukces gdy
" bar jest pomiędzy foo i baz, ale wyodrębnione jest tylko samo bar
syntax match squereBracket /\(\[\)\@<=.*\(\]\)\@=/
syntax match tyldeBracket /\(\`\)\@<=.*\(\`\)\@=/
syntax match astericBold /\(\*\*\)\@<=.*\(\*\*\)\@=/
syntax match curlyItalic /\({\)\@<=.*\(}\)\@=/
"syntax match astericItalic /\(\*\)\@<=.*\(*\)\@=/
syntax match floorUnderline /\(_\)\@<=.*\(_\)\@=/
" aby to poniższe działało musi być autokomenda w init.vim, którą tam już
" umieściłem
syntax match Todo /\[/ conceal
syntax match Todo /\]/ conceal
syntax match Todo /{/ conceal
syntax match Todo /}/ conceal
syntax match Todo /\`/ conceal
syntax match Todo /\*\*/ conceal
syntax match Todo /_/ conceal
syntax match Todo /#/ conceal


hi def link bibleComment Title
hi def link bibleNumber String
hi def link bibleConstant Tag
hi def link bibleTag Folded
"hi def link bibleTitle LineNr
hi def link bibleTitle String
hi def link bibleTitle2 String
hi def link bibleSlash Search
"hi def link cBracket Label
hi def link squereBracket Tag
hi def link tyldeBracket Label
hi def link astericBold Title
"hi def link astericItalic Comment
hi def link floorUnderline TabLineSel
hi def link curlyItalic SpecialKey
