sed -i -e 's/^foreground.*$/foreground #8f878e/' -e 's/^background.*$/background #1d1f1e/' /home/peter/.config/kitty/kitty.conf
sed -i -e 's/^set -g status-bg .*$/set -g status-bg "#222222"/' -e 's/^set -g status-fg .*$/set -g status-fg "#8f878e"/' -e 's/#\[fg=.*\]/#\[fg=#cccccc\]/' -e 's/W#.*\*/W#\[fg=#32a852\]\*/' -e 's/^setw -g window-status-style .*$/setw -g window-status-style bg="#222222",fg="#8f878e"/' -e 's/^setw -g window-status-current-style bg.*$/setw -g window-status-current-style bg="#222222",fg="#8f878e"/' -e 's/^set -g pane-active-border-style fg.*$/set -g pane-active-border-style fg="#111111"/' -e 's/^set -g pane-border-style fg.*$/set -g pane-border-style fg="#8f878e"/' /home/peter/.tmux.conf
sed -i -e 's/^theme.border_normal.*$/theme.border_normal = "#333333"/' -e 's/^theme.border_focus.*$/theme.border_focus = "#888888"/' -e 's/^theme.bg_normal.*$/theme.bg_normal = "#1d1f1e"/' -e 's/theme.bg_focus.*$/theme.bg_focus = "#1d1f1e"/' /home/peter/.config/awesome/themes/multicolor/theme.lua
awesome-client 'awesome.restart()'
tmux detach-client -t 0
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty
tmux attach-session -t 0
