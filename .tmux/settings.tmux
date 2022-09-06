# Shahzad's Tmux Option Settings (a bunch of sets).

# Fix Tmux colors (xterm-256 or tmux-256 does the trick for me).
set -g default-terminal "tmux-256color"
set-option -sa terminal-overrides ',tmux-256color:RGB'

# By default start with mouse on.
set -g mouse on

# Re-number windows automatically when middle ones are closed.
set-option -g renumber-windows on

# Enable ability to focus on events.
set -g focus-events on

# Setting the delay between prefix and command.
set -sg escape-time 2

# Ensure the key-codes are xterm alike
set -g xterm-keys on

# Enable vi like keys.
setw -g mode-keys vi

# To limit the scrollback buffer to 25 thousand lines:
set -g history-limit 25000

# Start windows and panes from index 1, not 0. (0 is at other side of the keyboard).
set -g base-index 1
setw -g pane-base-index 1

