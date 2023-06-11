"set nowrap                " Do not allow to text be wrapped to next line
set linebreak             " do not wrap within a word when set
set whichwrap=b,s,<,>,[,] " only these movement keys move the cursor to previous/next line
set showmatch             " for bracket matching
set nohlsearch
set incsearch
set ignorecase
set smartcase
set autochdir             " switch the working direcotry automatically
set mouse=a
"set number
set ttimeout		      " time out for key codes
set ttimeoutlen=0	      " wait up to 100ms after Esc for special key
set path+=,/usr/include/**
set nospell
set complete+=kspell
command Pl set spell spelllang=pl
command En set spell spelllang=en_us
command Ns set nospell 

autocmd BufEnter $HOME/notes/index.md set nospell

filetype plugin on
filetype indent on
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2          " 4 chars when pressing >> or <<. cancel with ==
set expandtab
"set list
"set listchars=tab:▸\ ,trail:·
" set confirm
command Gf :e <cfile>

" Save folded lines
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

" Save and Load folded lines and view for ubg.txt bible
"autocmd BufWinLeave /home/peter/notes/ubg.txt mkview! ubg_view
"autocmd BufWinEnter /home/peter/notes/ubg.txt silent! loadview


""" Groff snippets

autocmd BufNewFile,BufRead *.ms setfiletype groff
syntax on

" USAGE: to use those shortcuts type a name and then enter <space> key
inoreabbr .i .IP<CR>
inoreabbr .b \(bu<CR>
inoreabbr .l .LP<CR>
inoreabbr cmm .\" 
inoreabbr .c .comment<CR><CR>.endc<Esc>BbVjzfi<Space><Space><Space>

map <F3> :!grop %<CR><CR>
map <F4> :!gro %<CR><CR>
map <C-h> :cd<CR>

"Leader key
let mapleader = ";"
map <leader>so :source /home/peter/.config/nvim/init.vim<CR>

"Buffer settings
map <leader>k :bn<CR>
map <leader>j :bN<CR>

" Show markdown files in firefox
map <leader>mc :!mdprint %<CR><CR>
map <leader>mu :!mdupdate %<CR><CR>
inoreabbr subsup <sub><sup></sup></sub><Esc>4ba

"mapping C-u and C-D for speed
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" better block of code intendation in v mode
vnoremap < <gv 
vnoremap > >gv

map <leader>hr :call ToggleHiddenAll()<CR>

"cursor shape for normal and insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[3 q"

if !has('gui_running')
  set t_Co=256
endif
if has("termguicolors")
    " enable true color
    set termguicolors
endif

"EASYMOTION - find in your screen
"Easymotion Plugin leader key:
map ;; <Plug>(easymotion-prefix)
" TIP: find forward and backward: ;; s
" show word signs above: ;;b
" show word signs beneath: ;;w

" Mappings for fzf-vim
map <leader>ff :cd<CR>:Files<CR>
map <leader>fz :Files<CR>
map <leader>tg :Tags<CR>


" Find files using Telescope command-line
nnoremap <leader>fr <cmd>Telescope find_files find_command=rg,--ignore,--files<cr>
nnoremap <leader>fn <cmd>Telescope find_files<cr>
nnoremap <leader>fw <cmd>cd<cr><cmd>Telescope file_browser<cr>
nnoremap <leader>lg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers  show_all_buffers=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>tg <cmd>Telescope find_command=fzf#vim#tags<cr>


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
Plug 'junegunn/goyo.vim'
Plug 'folke/which-key.nvim'
"Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

" STARTify -----------------------------------
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

" --------------------------------------------
"  NERDTREE
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-x> :NERDTreeToggle<CR>
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif




" Tip : nerdcommenter toggle comment/uncomment: leader(that is: ;)+c+spacja

" vim-markdown plugin configuration:  -----------------
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_conceal = 1
"let g:markdown_folding = 1                   " native markdown_folding
"inoreabbr mlink []()<CR><Esc>bli






"----------------------------------------------
" Tip for auto-pairs:
" Move out of pairs using M-n
" Wrap existing text by moving cursor at the beginning and using M-e


"_____________________________________________
" CoC Configuration - mappings mainly
" ____________________________________________
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Stara obsługa dla TAB
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Nowa obsługa dla TAB
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gT <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>#  <Plug>(coc-format-selected)
nmap <leader>#  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  "" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" bible
au BufRead,BufNewFile *.bible set filetype=bible
au! Syntax bible source ~/.config/nvim/syntax/bible.vim
"au BufRead,BufNewFile *.bible set conceallevel=2



"UNIVERSAL TAGS
set tags+=./tags;,tags
nnoremap <leader>tt :!ctags -R . <CR>
" Generate ctags silently
"nnoremap <leader>tt :silent !ctags -R . <CR>:redraw!<CR>
"
"space instead of `~` sign at the end of buffer
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾ 

command Nc e ~/.config/nvim/init.vim
command H cd ~/
command Note cd ~/notes/

let g:airline_theme='monochrome'
"let g:airline_theme='biogoo'
"let g:airline_theme='solarized'
"let g:airline_theme='peaksea'
"let g:airline_theme='transparent'

"Folding text style
set foldtext=MyFoldText()
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return  '+ ' . sub . '  ...'
endfunction

let g:indentLine_color_term = 239


nmap <silent> gy :tabnext<cr>
nmap <silent> gt :tabprevious<cr>

let g:goyo_width = 90

nnoremap <leader>gp :!g++ *.cpp <CR>
nnoremap <leader>su :%s/

set shortmess=F
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction


" --------------------------------------------
" Tips for which-key plugin
" which-key plugin usage: 
"     type first letter and wait; 
"     type your leader key; 
"     type " for registers list; 
"     type z= for spellchecking; 
"     type ` for marks list

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
