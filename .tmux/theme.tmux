# Shahzad's Tmux Design/Theme/Coloring Configuration.

# Loud / quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

# The modes.
setw -g clock-mode-colour colour135
setw -g mode-style "bold bg=colour238 fg=colour196"

# The panes.
set -g pane-border-style "bg=colour235 fg=colour238"
set -g pane-active-border-style "bg=colour236 fg=colour51"

# The statusbar.
set -g status-justify left
set -g status-interval 2

set -g status-position bottom
set -g status-style "dim bg=colour234 fg=colour137"
# Info on left (there is no session display for now).
set -g status-left ''
set -g status-right '#[bold fg=colour233 bg=colour241] %d/%m #[bold fg=colour233 bg=colour245] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

# Window mode
setw -g window-status-current-style "bold bg=colour238 fg=colour81"
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
setw -g window-status-style "none bg=colour235 fg=colour138"
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
setw -g window-status-bell-style "bold bg=colour1 fg=colour255"

# Messaging
set -g message-style "bright fg=colour51 bg=black"
set -g message-command-style "bg=black fg=colour51"
