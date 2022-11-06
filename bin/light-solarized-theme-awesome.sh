sed -i -e 's/^foreground.*$/foreground #3e6b6b/' -e 's/^background.*$/background #faf5e8/' /home/peter/.config/kitty/kitty.conf
sed -i -e 's/^set -g status-bg .*$/set -g status-bg "#e8e2d1"/' -e 's/^set -g status-fg .*$/set -g status-fg "#3e6b6b"/' -e 's/#\[fg=.*\]/#\[fg=#777777\]/' -e 's/W#.*\*/W#\[fg=#32a852\]\*/' -e 's/^setw -g window-status-style .*$/setw -g window-status-style bg="#e8e2d1",fg="#3e6b6b"/' -e 's/^setw -g window-status-current-style bg.*$/setw -g window-status-current-style bg="#e8e2d1",fg="#3e6b6b"/' -e 's/^set -g pane-active-border-style fg.*$/set -g pane-active-border-style fg="#111111"/' -e 's/^set -g pane-border-style fg.*$/set -g pane-border-style fg="#3e6b6b"/' /home/peter/.tmux.conf
sed -i -e 's/^theme.border_normal.*$/theme.border_normal = "#e8e2d1"/' -e 's/^theme.border_focus.*$/theme.border_focus = "#888888"/' -e 's/^theme.wibar_bg.*$/theme.wibar_bg = "#faf5e8"/' -e 's/^theme.wibar_fg.*$/theme.wibar_fg = "#3e6b6b"/' -e 's/theme.tasklist_fg_focus.*$/theme.tasklist_fg_focus = "#3e6b6b"/' -e 's/theme.tasklist_bg_focus.*$/theme.tasklist_bg_focus = "#faf5e8"/' -e 's/^theme.taglist_bg_focus.*$/theme.taglist_bg_focus = "#faf5e8"/' /home/peter/.config/awesome/wombat-2/theme.lua
awesome-client 'awesome.restart()'
tmux detach-client -t 0
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty
tmux attach-session -t 0
