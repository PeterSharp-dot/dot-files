#!/bin/sh

# hsetroot -solid "#000000"

# Kitty theme change
sed -i -e 's/^foreground #.*$/foreground #aaaaaa/' -e 's/^background #.*$/background #202636/' /home/peter/.config/kitty/kitty.conf

# tmux theme change
sed -i -e 's/^set -g status-bg "#.*$/set -g status-bg "#202636"/' -e 's/^set -g status-fg "#.*$/set -g status-fg "#aaaaaa"/' -e "s/^set -g status-left.*$/set -g status-left '#\[fg=#cccccc\]#S '/" -e "s/^set -g status-right '#\[fg.*\]/set -g status-right '#[fg=#cccccc\]/" -e "s/^setw -g window-status-style bg.*$/setw -g window-status-style bg="#111111",fg="#aaaaaa"/" -e 's/setw -g window-status-current-style bg="#.*$/setw -g window-status-current-style bg="#111111",fg="#aaaaaa"/' -e 's/^set -g pane-active-border-style fg="#.*$/set -g pane-active-border-style fg="#333333"/' -e 's/^set -g pane-border-style fg="#.*$/set -g pane-border-style fg="#111111"/' /home/peter/.tmux.conf

#sed -i -e 's/^user_pref("ui.systemUsesDarkTheme", 0/user_pref("ui.systemUsesDarkTheme", 1/' $HOME/.mozilla/firefox/ex8dw9xo.default-release-1637767742313/prefs.js

#For polybar theme change
# colors-dark.sh -amber

#killall /usr/lib64/firefox/firefox
#lof /usr/lib64/firefox/firefox

tmux detach-client -t 0
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty
tmux attach-session -t 0

#polybar-msg cmd hide
