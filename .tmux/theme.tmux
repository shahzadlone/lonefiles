# Shahzad's Tmux Design/Theme/Coloring Configuration.

# # Loud / quiet?
# set-option -g visual-activity off
# set-option -g visual-bell off
# set-option -g visual-silence off
# set-window-option -g monitor-activity off
# set-option -g bell-action none
#
# # The modes.
# setw -g clock-mode-colour colour135
# setw -g mode-style "bold bg=colour238 fg=colour196"
#
# # The panes.
# set -g pane-border-style "bg=colour235 fg=colour238"
# set -g pane-active-border-style "bg=colour236 fg=colour51"
#
# # The statusbar.
# set -g status-justify left
# set -g status-interval 2
#
# set -g status-position bottom
# set -g status-style "dim bg=colour234 fg=colour137"
# # Info on left (there is no session display for now).
# set -g status-left ''
# set -g status-right '#[bold fg=colour233 bg=colour241] %d/%m #[bold fg=colour233 bg=colour245] %H:%M:%S '
# set -g status-right-length 50
# set -g status-left-length 20
#
# # Window mode
# setw -g window-status-current-style "bold bg=colour238 fg=colour81"
# setw -g window-status-style "none bg=colour235 fg=colour138"
# setw -g window-status-bell-style "bold bg=colour1 fg=colour255"
# #setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
# #setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
#
# # Show if pane are synchronized in this window?
# setw -g window-status-current-format ' #{?pane_synchronized,#[bg=blue],}#I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
# setw -g window-status-format         ' #{?pane_synchronized,#[bg=blue],}#I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
#
# # Messaging
# set -g message-style "bright fg=colour51 bg=black"
# set -g message-command-style "bg=black fg=colour51"



################################################################ NORD CUSTOM  #########################################
# FROM:
#  -  https://github.com/casonadams/nord.vim
#  -  https://unix.stackexchange.com/questions/494237/tmux-is-it-possible-to-dim-the-inactive-window-and-on-the-same-time-have-transp
#######################################################################################################################
#set -g status-style fg=white,bg=brightblack
#setw -g clock-mode-colour cyan
#
#set -g mode-style bg=brightcyan,fg=black
#set -g message-style bg=brightblack,fg=cyan
#set -g message-command-style bg=brightblack,fg=cyan
#
#set -g status-left '#{?pane_synchronized, ¤ ,}#{?window_zoomed_flag, ↕ ,}[#S-#{window_active_clients}]'
#set -g status-right '#H'
#
#path="#(if [[ $HOME == #{pane_current_path} ]]; then echo \"~\" ; else echo #{b:pane_current_path}; fi)"
#
#set -g pane-border-style fg=brightblack,bg=black
#set -g pane-active-border-style fg=blue,bg=black
#set-window-option -g window-active-style bg=terminal
#set-window-option -g window-style bg=black
#
#set-window-option -g window-status-style bg=default,fg=default
#set-window-option -g window-status-current-style bg=default,fg=cyan
#set-window-option -g window-status-activity-style bg=default,fg=yellow
#set-window-option -g window-status-separator ""
#set-window-option -g window-status-current-format " $path "
#set-window-option -g window-status-format " $path "
#######################################################################################################################

# Set active and inactive window styles (to Dim inactive panes).
set -g window-style "bg=black fg=default"
set -g window-active-style "bg=terminal fg=default"

# Make borders a double lined separator.
set -g pane-border-lines "double"

