set statusline=
set statusline+=%#TabLineSel#
set statusline+=\ %f
"set statusline+=%#CursorLine#
set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=%#Function#
set statusline+=\ %l:%c
set statusline+=\ 

set whichwrap=b,s,<,>,[,]
set showmatch " for bracket matching
set nohlsearch
set incsearch
set autochdir " switch the working direcotry automatically
"set number
set ttimeout		" time out for key codes
set ttimeoutlen=0	" wait up to 100ms after Esc for special key
set path+=**
setlocal nospell

filetype plugin on
filetype indent on
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4      " 4 chars when pressing >> or <<. cancel with ==
set expandtab

" Save folded lines
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" Groff snippets
autocmd BufNewFile,BufRead *.ms setfiletype groff
syntax on

inoreabbr grotex .\" to compile and open pdf: :!grop % (pdf in /tmp)<CR>.\" to compile only: :!gro % (pdf in /tmp)<CR>.\" snippets (insert mode): heading .SH 1 = .s , paragraph .LP = .l<CR>.\" Also to create another paragraph insert empty line<CR>.\" Indented paragraph: .PP<CR>.\" .gcolor blue<CR>.\" .gcolor - black default<CR>.\" .B - bold (until empty line)<CR><CR>.de cb<CR>.SM<CR>.CW<CR>..<CR>.<CR>.de bi<CR>.IP \(bu<CR>..<CR><CR>.nr PS 12<CR>.nr VS 10*1700/1000<CR><CR>.TL 

inoreabbr .s .SH 
inoreabbr .i .IP
inoreabbr .b \(bu
inoreabbr .l .LP

map <F5> :!grop %<CR>
map <F4> :!gro %<CR>
map <C-h> :cd<CR>

"Leader key
let mapleader = ";"

"Buffer settings
map <leader>j :bn<CR>
map <leader>k :bN<CR>

"mapping C-u and C-D for speed
"map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
"map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

"better block of code intendation
vnoremap < <gv 
vnoremap > >gv

"cursor shape for normal and insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

if !has('gui_running')
  set t_Co=256
endif
if has("termguicolors")
    " enable true color
    set termguicolors
endif

"Easymotion Plugin leader key
map ;; <Plug>(easymotion-prefix)
" find forward and backward: ;; s

" Mappings for fzf-vim
map <leader>f :cd<CR>:Files<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>p <cmd>Telescope find_files find_command=rg,--ignore,--files<cr>
"nnoremap <leader>f <cmd>cd<cr><cmd>Telescope file_browser<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers  show_all_buffers=true<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

colorscheme zellner2
"set cursorline 
"set cursorcolumn

" plugins: ------------------------------------
call plug#begin(stdpath('data') . '/plugged')
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter' 
Plug 'easymotion/vim-easymotion'
Plug 'gabrielelana/vim-markdown'
Plug 'nvim-lua/popup.nvim'
Plug 'chrisbra/Colorizer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'     
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" --------------------------------------------
"nerdcommenter toggle comment/uncomment: leader(;)+c+spacja

" vim-markdown plugin configuration:
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_conceal = 1
