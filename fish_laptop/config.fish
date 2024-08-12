if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /home/peter/.bin
fish_add_path /home/peter/.local/bin
fish_add_path /home/peter/.cargo/bin
fish_add_path /home/peter/.local/lib
set -gx COOKIE_FILE "/home/peter/.local/bin/cookies.json"
set -gx TERM xterm-256color
set -gx GPG_TTY $(tty)
set -gx MANWIDTH 80
set -gx STARDICT_DATA_DIR /home/peter/sdcv/
set -gx TERMINAL /usr/bin/kitty
set -gx BROWSER firefox
set -gx COLORTERM truecolor
set -gx SHFM_OPENER "/home/peter/.local/bin/shfm-opener.sh"
set -gx EDITOR nvim
set -gx VISUAL nvim
# set -gx FZF_DEFAULT_COMMAND 'ag --hidden --depth 4 --ignore .git -f -g ""'
set -gx BAT_THEME OneHalfLight
set -gx XDG_CURRENT_DESKTOP KDE
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx NOTES /home/peter/notes/

bind -M insert \cy accept-autosuggestion

source /home/peter/.local/bin/tty-colors.sh

fish_vi_key_bindings
set -g fish_greeting 'Welcome to Fish shell  '
function fish_prompt
    echo -n (prompt_pwd) ' > '
end
#function fish_right_prompt 
#pwd 
#end
function t
    ls && clear && pwd && tree --cmd -L 1 | bat -p --color always
end
function media
    cd /run/media/peter
end
function pen
    cd /run/media/peter/D120-CF00/
end
# # Funkcja, która sprawdza, czy bieżący katalog jest repozytorium Git i wykonuje git pull
# function check_and_pull_git
#     if test -d .git
#         git pull
#     end
# end
# # Funkcja, która jest uruchamiana przy zmianie katalogu
# function check_on_cd --on-variable PWD
#     # Sprawdzanie i wykonywanie git pull
#     check_and_pull_git
# end
function sd
    if test (count $argv) -eq 0
        cd $HOME && cd "$(fd -H -t d | fzf --height 40% --layout reverse --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && pwd && lsd -a --color=always
    else
        cd $HOME && cd "$(fd -H -t d | fzf --height 40% --layout reverse  --query="$argv[1]" --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && pwd && lsd -a --color=always
    end
end
function vif
    cd $HOME
    nvim $(fzf)
end
function rgall
    clear && rga -B 5 -A 4
end
function tra
    clear && trans :pl $argv -show-translation-phonetics | bat --color always -p
end
# function increase_brightness
#     echo -n '\033]128;\;255\a' | cat
#     brightnessctl s +10%
# end
# function decrease_brightness
#     echo -n '\033]128;\;0\a' | cat
#     brightnessctl s 10%-
# end
# alias ls='ls'
# alias ls='lsd --color=always'
alias l1='lsd -1 --color=always'
alias la='lsd -la --color=always'
alias l='lsd --color=always'
alias ll='lsd -l --color=always'
#alias l1='lsd -1 --color=always'
#alias la='lsd -la --color=always'
#alias l='lsd --color=always'
#alias ll='lsd -l --color=always'
alias chat='tgpt'
alias bing='edge-gpt --rich --style creative'
alias pliki='pcmanfm'
alias photo='sxiv'
#alias rga='rga --color always -B 1 -A 1'
alias rga='rga --color always --heading'
alias ebook='foliate'
alias disc='lsblk -l -o FSSIZE,FSAVAIL,FSUSE% | awk \'NR==7\' | awk \'{print "SIZE:" $1 "  AVAIL:" $2 "  USED:" $3}\''
alias vimpager='vim -R --cmd "set guicursor=n-v-c:ver25" --cmd "nnoremap <silent> <buffer> <Up> <NOP>" --cmd "nnoremap <silent> <buffer> <Down> <NOP>" --cmd "nnoremap <silent> <buffer> <Left> <NOP>" --cmd "nnoremap <silent> <buffer> <Right> <NOP>" --cmd "nnoremap <silent> <buffer> <Home> <NOP>" --cmd "nnoremap <silent> <buffer> <End> <NOP>" --cmd "nnoremap <silent> <buffer> <PageUp> <NOP>" --cmd "nnoremap <silent> <buffer> <PageDown> <NOP>" --cmd "nnoremap <silent> <buffer> <Enter> <NOP>" --cmd "nnoremap <silent> <buffer> i <NOP>" --cmd "nnoremap <silent> <buffer> a <NOP>" --cmd "nnoremap <silent> <buffer> v <NOP>" --cmd "nnoremap <silent> <buffer> V <NOP>" --cmd "nnoremap <silent> <buffer> <C-v> <NOP>"'
alias ,='devour'
alias z='zathura'
