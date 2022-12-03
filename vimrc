" settings
source $VIMRUNTIME/defaults.vim
set ignorecase
set smartcase
set autochdir             
let &t_SI = "\e[5 q"
let &t_EI = "\e[3 q"
set scrolloff=1
colorscheme zellner2
"Folding text style
set foldtext=MyFoldText()
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return  '+ ' . sub . '  ...'
endfunction

if !has('gui_running')
  set t_Co=256
endif
if has("termguicolors")
    " enable true color
    set termguicolors
endif

let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'

" commands
vnoremap < <gv 
vnoremap > >gv
""" Groff snippets
autocmd BufNewFile,BufRead *.ms setfiletype groff
syntax on

inoreabbr grotex .\" to compile and open pdf: :!grop % (pdf in /tmp)<CR>.\" to compile only: :!gro % (pdf in /tmp)<CR>.\" snippets (insert mode): heading .SH 1 = .s , paragraph .LP = .l<CR>.\" Also to create another paragraph insert empty line<CR>.\" Indented paragraph: .PP<CR>.\" .gcolor blue<CR>.\" .gcolor - black default<CR>.\" .B - bold (until empty line)<CR><CR>.nr PO 1.5i<CR>.nr LL 4.5i<CR>.de cb<CR>.SM<CR>.CW<CR>..<CR>.<CR>.de bi<CR>.IP \(bu<CR>..<CR><CR>.nr PS 12<CR>.nr VS 10*1700/1000<CR><CR>.TL 

inoreabbr .s .SH<CR>
inoreabbr .i .IP<CR>
inoreabbr .b \(bu<CR>
inoreabbr .l .LP<CR>
inoreabbr .c .\" 

map <F3> :!grop %<CR><CR>
map <F4> :!gro %<CR><CR>
map <C-h> :cd<CR>
