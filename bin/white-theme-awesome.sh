sed -i -e 's/^foreground.*$/foreground #222222/' -e 's/^background.*$/background #ffffff/' /home/peter/.config/kitty/kitty.conf
sed -i -e 's/^set -g status-bg.*$/set -g status-bg "#eeeeee"/' -e 's/^set -g status-fg.*$/set -g status-fg "#000000"/' -e 's/#\[fg.*\]/#\[fg=#000000\]/' -e 's/W#.*\*/W#\[fg=#32a852\]\*/' -e 's/^setw -g window-status-style bg.*$/setw -g window-status-style bg="#eeeeee",fg="#000000"/' -e 's/^setw -g window-status-current-style bg=.*$/setw -g window-status-current-style bg="#eeeeee",fg="#000000"/' -e 's/^set -g pane-active-border-style fg.*$/set -g pane-active-border-style fg="#dddddd"/' -e 's/^set -g pane-border-style fg.*$/set -g pane-border-style fg="#eeeeee"/' /home/peter/.tmux.conf
sed -i -e 's/^theme.border_normal.*$/theme.border_normal = "#eeeeee"/' -e 's/^theme.border_focus.*$/theme.border_focus = "#aaaaaa"/' -e 's/^theme.bg_normal.*$/theme.bg_normal = "#333333"/' -e 's/^theme.bg_focus.*$/theme.bg_focus = "#333333"/' /home/peter/.config/awesome/themes/multicolor/theme.lua
awesome-client 'awesome.restart()'
tmux detach-client -t 0 
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty 
tmux attach-session -t 0 
