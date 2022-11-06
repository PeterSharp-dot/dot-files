sed -i -e 's/^foreground.*$/foreground #777777/' -e 's/^background.*$/background #000000/' /home/peter/.config/kitty/kitty.conf
sed -i -e 's/^set -g status-bg.*$/set -g status-bg "#111111"/' -e 's/^set -g status-fg.*$/set -g status-fg "#777777"/' -e 's/#\[fg=.*\]/#\[fg=#777777\]/'  -e 's/W#.*\*/W#\[fg=#32a852\]\*/' -e 's/^setw -g window-status-style bg=.*$/setw -g window-status-style bg="#111111",fg="#777777"/' -e 's/setw -g window-status-current-style.*$/setw -g window-status-current-style bg="#111111",fg="#777777"/' -e 's/^set -g pane-active-border-style fg=.*$/set -g pane-active-border-style fg="#333333"/' -e 's/^set -g pane-border-style fg=.*$/set -g pane-border-style fg="#111111"/' /home/peter/.tmux.conf
sed -i -e 's/^theme.border_normal.*$/theme.border_normal = "#111111"/' -e 's/^theme.border_focus.*$/theme.border_focus = "#222222"/' -e 's/^theme.wibar_bg.*$/theme.wibar_bg = "#000000"/' -e 's/^theme.wibar_fg.*$/theme.wibar_fg = "#777777"/' -e 's/theme.tasklist_fg_focus.*$/theme.tasklist_fg_focus = "#777777"/' -e 's/theme.tasklist_bg_focus.*$/theme.tasklist_bg_focus = "#000000"/' -e 's/^theme.taglist_bg_focus.*$/theme.taglist_bg_focus = "#000000"/' /home/peter/.config/awesome/wombat-2/theme.lua
awesome-client 'awesome.restart()'
tmux detach-client -t 0
tmux source-file ~/.tmux.conf
pkill -USR1 -x kitty
tmux attach-session -t 0
