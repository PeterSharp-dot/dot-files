#!/bin/bash

# hsetroot -solid "#ffffff"

#change Kitty theme
sed -i -e 's/^foreground #.*$/foreground #777777/' -e 's/^background #.*$/background #eeeeee/' /home/peter/.config/kitty/kitty.conf

#change tmux theme
sed -i -e 's/^set -g status-bg "#.*$/set -g status-bg "#eeeeee"/' -e 's/^set -g status-fg "#.*$/set -g status-fg "#000000"/' -e "s/^set -g status-left.*$/set -g status-left '#\[fg=#000000]#S '/" -e "s/^set -g status-right '#\[fg.*\]/set -g status-right '#[fg=#000000\]/" -e 's/^setw -g window-status-style bg.*$/setw -g window-status-style bg="#eeeeee",fg="#000000"/' -e 's/setw -g window-status-current-style bg="#.*$/setw -g window-status-current-style bg="#eeeeee",fg="#000000"/' -e 's/^set -g pane-active-border-style fg="#.*$/set -g pane-active-border-style fg="#dddddd"/' -e 's/^set -g pane-border-style fg="#.*$/set -g pane-border-style fg="#eeeeee"/' /home/peter/.tmux.conf

##change firefox motive
#sed -i -e 's/^user_pref("ui.systemUsesDarkTheme", 1/user_pref("ui.systemUsesDarkTheme", 0/' $HOME/.mozilla/firefox/ex8dw9xo.default-release-1637767742313/prefs.js

#Polybar light bar change
# colors-light.sh -amber

#killall  /usr/lib64/firefox/firefox
#lof /usr/lib/firefox/firefox

tmux detach-client -t 0
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty
tmux attach-session -t 0

#For polybar
#polybar-msg cmd hide
