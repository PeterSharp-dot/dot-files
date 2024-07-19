if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /home/peter/.bin
fish_add_path /home/peter/.local/bin
fish_add_path /home/peter/.cargo/bin
fish_add_path /home/peter/.local/lib
#set -gx PATH /home/peter/.local/share/pypy3.10-v7.3.16-linux64/bin $PATH
set -gx PATH /usr/bin/python $PATH
set -gx COOKIE_FILE "/home/peter/.local/bin/cookies.json"
set -gx TERM xterm-256color
set -gx GPG_TTY $(tty)
set -gx MANWIDTH 80
set -gx STARDICT_DATA_DIR /home/peter/sdcv/
#set -gx TERMINAL "/usr/bin/kitty"
set -gx BROWSER firefox
set -gx COLORTERM truecolor
set -gx SHFM_OPENER "/home/peter/.local/bin/shfm-opener.sh"
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --depth 4 --ignore .git -f -g ""'
set -gx BAT_THEME "Solarized (light)"
set -gx XDG_CURRENT_DESKTOP KDE
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx NOTES /home/peter/notes/
set -gx VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_icd64.json
set -gx MESA_GLTHREAD=true
set -gx MESA_GLSL_CACHE_DISABLE=true
set -gx MESA_EXTENSION_MAX_YEAR=2020
source /home/peter/.local/bin/tty-colors.sh

bind -M insert \cf accept-autosuggestion
bind -M insert \cy accept-autosuggestion

fish_vi_key_bindings
set -g fish_greeting 'Welcome to Fish shell  '
function fish_prompt
    echo -n '['(prompt_pwd)'] > '
end
#function fish_right_prompt 
#pwd 
#end
function t
    lsd && clear && pwd && tree -C -L 1
end
function media
    cd /run/media/peter
end
function pen
    cd /run/media/peter/D120-CF00 && ls
end

function sd
    if test (count $argv) -eq 0
        cd $HOME && cd "$(fd -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && pwd && lsd -a --color=always
    else
        cd $HOME && cd "$(fd -H -t d | fzf --query="$argv[1]" --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && pwd && lsd -a --color=always
    end
end

function vif
    cd $HOME && nvim $(fzf)
end
function rgall
    clear && rga -B 5 -A 4
end
function tra
    clear && trans :pl $argv -show-translation-phonetics | bat -p --color always
end

#alias ls='lsd --color=always'
alias l1='lsd -1 --color=always'
alias la='lsd -la --color=always'
alias l='lsd --color=always'
alias ll='lsd -l --color=always'
alias chat='tgpt'
alias bing='edge-gpt --rich --style creative --cookie-file /home/peter/.local/bin/cookies.json'
alias pliki='pcmanfm'
#alias rga='rga --color always -B 1 -A 1'
alias rga='rga --color always --heading'
alias meta5='wine /home/peter/.wine/drive_c/Program\ Files/MetaTrader\ 5/terminal64.exe'
alias note='cd /home/peter/notes && nvim index.md'
alias ,='devour'
