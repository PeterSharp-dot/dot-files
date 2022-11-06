#!/bin/sh

hsetroot -solid "#000000"

# Kitty theme change
sed -i -e 's/^#foreground #aaaaaa/foreground #aaaaaa/' -e 's/^#background #000000/background #000000/' -e 's/^foreground #777777/#foreground #777777/' -e 's/^background #ffffff/#background #ffffff/' /home/peter/.config/kitty/kitty.conf

# tmux theme change
sed -i -e 's/^set -g status-bg "#eeeeee"/set -g status-bg "#111111"/' -e 's/^set -g status-fg "#000000"/set -g status-fg "#aaaaaa"/' -e 's/#\[fg=#000000/#\[fg=#cccccc/' -e 's/^setw -g window-status-style bg="#eeeeee",fg="#000000"/setw -g window-status-style bg="#111111",fg="#aaaaaa"/' -e 's/setw -g window-status-current-style bg="#eeeeee",fg="#000000"/setw -g window-status-current-style bg="#111111",fg="#aaaaaa"/' -e 's/^set -g pane-active-border-style fg="#dddddd"/set -g pane-active-border-style fg="#333333"/' -e 's/^set -g pane-border-style fg="#eeeeee"/set -g pane-border-style fg="#111111"/' /home/peter/.tmux.conf

#sed -i -e 's/^user_pref("ui.systemUsesDarkTheme", 0/user_pref("ui.systemUsesDarkTheme", 1/' $HOME/.mozilla/firefox/ex8dw9xo.default-release-1637767742313/prefs.js

#For polybar theme change
colors-dark.sh -amber

#killall /usr/lib64/firefox/firefox
#lof /usr/lib64/firefox/firefox

tmux detach-client -t 0
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty
tmux attach-session -t 0

#polybar-msg cmd hide 
