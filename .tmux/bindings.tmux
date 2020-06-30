# Shahzad's Tmux Bindings/Unbindings/Mappings.

# Remap prefix to ` and unbind C-b. Also make `` send a single real ` signal(character).
unbind C-b
set -g prefix `
bind ` send-prefix

# Quickly source the .tmux.conf file, and display they message.
unbind r
bind r source-file ~/.tmux.conf \; display-message "Tmux Configuration is Sourced."

# Enable and disable mouse whenever I want with these bindings.
unbind M
unbind m
bind M set-option -g mouse on \; display 'Mouse: ON'
bind m set-option -g mouse off \; display 'Mouse: OFF'

# Toggle the mouse option.
unbind C-m
bind C-m set-option -g mouse \; display 'Mouse: Toggled'

# Make splitting panes more intuitive (and also open the new panes to be in same path).
unbind |
unbind -
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind %
unbind '"'

# Open the new window to be in the same path.
unbind n
bind n new-window -c "#{pane_current_path}"

# Shift arrow to switch windows
unbind l
unbind h
bind -r h previous-window
bind -r l next-window

# Start copy mode.
unbind c
bind c copy-mode
unbind '['

# Paste using this binding.
unbind p
bind p paste-buffer
unbind ']'

# Kill pane.
unbind k
bind -r k confirm-before -p "kill-pane #P? (y/n)" kill-pane

# List tmux sessions interactively.
unbind j
bind j choose-window

# Turn on and off syncronization of panes.
unbind s
unbind S
bind s setw synchronize-panes on \; display 'Pane Sync: ON'
bind S setw synchronize-panes off \; display 'Pane Sync: OFF'

# Switch around panes.
unbind x
unbind X
bind -r x swap-pane -D
bind -r X swap-pane -U
unbind '}'
unbind '{'

# Switching strictly between tmux panes, recursively (without awareness of vim splits).
unbind Left
unbind Right
unbind Up
unbind Down
bind -r Left select-pane -L
bind -r Right select-pane -R
bind -r Up select-pane -U
bind -r Down select-pane -D

# Smart pane switching with awareness of vim splits (NOTE: no prefix key needed).
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind -n C-h if-shell "${is_vim}" "send-keys C-h"  "select-pane -L"
bind -n C-j if-shell "${is_vim}" "send-keys C-j"  "select-pane -D"
bind -n C-k if-shell "${is_vim}" "send-keys C-k"  "select-pane -U"
bind -n C-l if-shell "${is_vim}" "send-keys C-l"  "select-pane -R"
bind -n C-\\ if-shell "${is_vim}" "send-keys C-\\" "select-pane -l"

# Resize tmux panes with ctrl + h j k l (recursive, meaning only press prefix once).
unbind C-Left
unbind C-Down
unbind C-Up
unbind C-Right
bind -r C-h resize-pane -L
bind -r C-j resize-pane -D
bind -r C-k resize-pane -U
bind -r C-l resize-pane -R

# Copy past shortcuts.
bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
bind-key -T copy-mode-vi 'V' send -X select-line
bind-key -T copy-mode-vi 'r' send-keys -X rectangle-toggle
bind-key -T copy-mode-vi 'y' send-keys -X copy-selection

#run-shell "tmux setenv -g TMUX_VERSION $(tmux -V | cut -c 6-)"
#if-shell -b '[ "$(echo "$TMUX_VERSION < 2.4" | bc)" = 1 ]' \
#  "bind-key Escape copy-mode; \
#  bind-key -t vi-copy Escape cancel; \
#  bind-key p paste-buffer; \
#  bind-key -t vi-copy v begin-selection; \
#  bind-key -t vi-copy V select-line; \
#  bind-key -t vi-copy r rectangle-toggle; \
#  bind -t vi-copy y copy-pipe 'xclip -in -selection clipboard'"
#
#if-shell -b '[ "$(echo "$TMUX_VERSION >= 2.4" | bc)" = 1 ]' \
#  "bind-key -T copy-mode-vi 'v' send -X begin-selection; \
#  bind-key -T copy-mode-vi 'V' send -X select-line; \
#  bind-key -T copy-mode-vi 'r' send -X rectangle-toggle; \
#  bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'"

# Move x clipboard into tmux paste buffer
# unbind C-p
#bind C-p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"

# Move tmux copy buffer into x clipboard
# unbind C-y
#bind C-y run "tmux save-buffer - | xclip -i"

