if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /home/peter/.bin 
fish_add_path /home/peter/.local/bin 
fish_add_path /home/peter/.cargo/bin
fish_add_path /home/peter/.local/lib
set -gx COOKIE_FILE "/home/peter/.local/bin/cookies.json"
set -gx TERM xterm-kitty
set -gx GPG_TTY $(tty)
set -gx MANWIDTH 80
set -gx STARDICT_DATA_DIR "/home/peter/sdcv/"
set -gx TERMINAL "/usr/bin/kitty"
set -gx BROWSER firefox
set -gx COLORTERM truecolor
set -gx SHFM_OPENER "/home/peter/.local/bin/shfm-opener.sh"
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --depth 4 --ignore .git -f -g ""'
set -gx BAT_THEME base16
set -gx XDG_CURRENT_DESKTOP KDE
set -gx QT_QPA_PLATFORMTHEME qt5ct

set -g fish_greeting 'Welcome to Fish shell  '
function fish_prompt 
  printf '>'
end
function fish_right_prompt 
  pwd 
end
function t
  ls && clear && pwd && tree -L 1
end
function media
  cd /run/media/peter
end
function sd
    cd $HOME && cd "$(fd -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)" && clear && pwd && ls -a --color &
end
function rgall
  clear && rga -B 5 -A 4
end
alias l1='ls -1'
alias l='ls'
alias chat='tgpt'
alias bing='edge-gpt --rich --style creative'
#alias rga='rga -B 5 -A 4'