# Shahzad's Tmux Option Settings (a bunch of sets).

# Fix Tmux colors (xterm-256 or tmux-256 does the trick for me).
set -g default-terminal "xterm-256color"
# set -g default-terminal "tmux-256color"
# set -g default-terminal "screen-256color"

# Setting the delay between prefix and command.
set -sg escape-time 2

# Ensure the key-codes are xterm alike
set -g xterm-keys on

# Enable vi like keys.
setw -g mode-keys vi

# To limit the scrollback buffer to 25 thousand lines:
set -g history-limit 25000
