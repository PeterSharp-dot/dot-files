"set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "zellner2"

"hi Normal guifg=black guibg=white
hi PreProc term=underline ctermfg=Gray guifg=#9900ff
hi Type term=underline ctermfg=Gray gui=NONE guifg=#ffcc66
hi Typedef term=underline ctermfg=Gray gui=NONE guifg=#0066ff
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=Black guibg=Yellow
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=Cyan
hi Tag term=NONE ctermfg=Gray guifg=Gray
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi Comment ctermbg=NONE ctermfg=244 guibg=NONE guifg=#6d9c75  
hi String ctermbg=NONE ctermfg=24   guibg=NONE guifg=#7497ad cterm=NONE gui=NONE
hi Constant ctermbg=NONE ctermfg=208  guibg=NONE  guifg=#ff8700 cterm=NONE gui=NONE
hi Statement ctermbg=NONE ctermfg=69   guibg=NONE guifg=#5f87ff cterm=NONE gui=NONE
hi Identifier ctermbg=NONE ctermfg=20   guibg=NONE    guifg=#ffaa00 cterm=NONE gui=NONE
"hi Type ctermbg=NONE ctermfg=90   guibg=NONE    guifg=#000087 cterm=NONE  gui=NONE
hi Special ctermbg=NONE ctermfg=35   guibg=NONE    guifg=#853903 cterm=NONE gui=NONE
"hi LineNr  ctermbg=NONE ctermfg=234  guibg=NONE guifg=#808080 cterm=NONE gui=NONE
hi LineNr  ctermbg=NONE ctermfg=234  guibg=NONE guifg=#777777 cterm=NONE gui=NONE
hi NonText ctermbg=NONE ctermfg=244  guibg=NONE    guifg=#808080 cterm=NONE gui=NONE
"hi Title  ctermbg=NONE ctermfg=22   guibg=NONE    guifg=#6f657d cterm=NONE  gui=NONE
hi Title  ctermbg=NONE ctermfg=22   guibg=NONE    guifg=NONE cterm=NONE  gui=bold
hi Folded ctermbg=15   ctermfg=235  guibg=NONE guifg=#3d6938 cterm=NONE  gui=NONE
hi Function   ctermbg=NONE ctermfg=33   guibg=NONE guifg=#006600 cterm=NONE gui=NONE
hi SpecialKey ctermbg=NONE ctermfg=244  guibg=NONE guifg=#808080 cterm=NONE gui=NONE
"hi CursorColumn     ctermbg=NONE  ctermfg=NONE guibg=#fafbfc guifg=NONE    cterm=NONE   gui=NONE
hi CursorColumn     ctermbg=NONE  ctermfg=NONE guibg=NONE guifg=NONE    cterm=NONE   gui=NONE
"hi CursorLine       ctermbg=NONE ctermfg=NONE guibg=#fafbfc    guifg=NONE    cterm=NONE  gui=NONE
hi CursorLine       ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE  gui=NONE
hi CursorLineNr     ctermbg=254  ctermfg=73   guibg=#fafbfc guifg=#5fafaf cterm=NONE gui=NONE
hi VertSplit       ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=#777777    cterm=NONE  gui=NONE

hi TabLineFill ctermbg=NONE ctermfg=244 guibg=NONE guifg=NONE cterm=NONE gui=NONE
hi TabLine ctermbg=NONE ctermfg=24   guibg=NONE guifg=#4f5f63 cterm=NONE gui=NONE
hi TabLineSel ctermbg=NONE ctermfg=208  guibg=NONE guifg=#934daa cterm=NONE gui=underline

hi Pmenu guibg=#111111 guifg=#aaaaaa
hi PmenuSel guibg=#333333 guifg=#eeeeee
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword	Function
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
"hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
