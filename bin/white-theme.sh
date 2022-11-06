#!/bin/bash

hsetroot -solid "#ffffff" 
sed -i -e 's/^foreground #aaaaaa/#foreground #aaaaaa/' -e 's/^background #000000/#background #000000/' -e 's/^#foreground #000000/foreground #000000/' -e 's/^#background #ffffff/background #ffffff/' /home/peter/.config/kitty/kitty.conf
sed -i -e 's/^set -g status-bg "#111111"/set -g status-bg "#eeeeee"/' -e 's/^set -g status-fg "#aaaaaa"/set -g status-fg "#000000"/' -e 's/#\[fg=#cccccc/#\[fg=#000000/' -e 's/^setw -g window-status-style bg="#111111",fg="#aaaaaa"/setw -g window-status-style bg="#eeeeee",fg="#000000"/' -e 's/setw -g window-status-current-style bg="#111111",fg="#aaaaaa"/setw -g window-status-current-style bg="#eeeeee",fg="#000000"/' -e 's/^set -g pane-active-border-style fg="#333333"/set -g pane-active-border-style fg="#dddddd"/' -e 's/^set -g pane-border-style fg="#111111"/set -g pane-border-style fg="#eeeeee"/' /home/peter/.tmux.conf
colors-light.sh -amber 
tmux detach-client -t 0 
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty 
tmux attach-session -t 0 
#polybar-msg cmd hide 
