# Shahzad's Tmux Bindings/Unbindings/Mappings.

# Remap prefix to ` and unbind C-b. Also make `` send a single real ` signal(character).
unbind C-b
set -g prefix `
bind ` send-prefix

# Quickly source the .tmux.conf file, and display they message.
unbind r
bind r source-file ~/.tmux.conf \; display-message "Tmux Configuration is Sourced."

# Get the mouse working when I want (toggle). So now if I can click to switch panes.
unbind M
unbind m
bind M set-option -g mouse on \; display 'Mouse: ON'
bind m set-option -g mouse off \; display 'Mouse: OFF'

# Make splitting panes more intuitive (and also open the new panes to be in same path).
unbind %
unbind '"'
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Open the new window to be in the same path.
bind c new-window -c "#{pane_current_path}"

# Resize tmux panes with ctrl + h j k l (recursive, meaning only press prefix once).
unbind C-Left
unbind C-Down
unbind C-Up
unbind C-Right
bind -r C-h resize-pane -L
bind -r C-j resize-pane -D
bind -r C-k resize-pane -U
bind -r C-l resize-pane -R

# Switching strictly between tmux panes, recursively (without awewness of vim splits).
unbind Left
unbind Down
unbind Up
unbind Right
bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

# Smart pane switching with awareness of vim splits (NOTE: no prefix key needed).
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind -n C-h if-shell "${is_vim}" "send-keys C-h"  "select-pane -L"
bind -n C-j if-shell "${is_vim}" "send-keys C-j"  "select-pane -D"
bind -n C-k if-shell "${is_vim}" "send-keys C-k"  "select-pane -U"
bind -n C-l if-shell "${is_vim}" "send-keys C-l"  "select-pane -R"
bind -n C-\ if-shell "${is_vim}" "send-keys C-\\" "select-pane -l"

# Move x clipboard into tmux paste buffer
unbind C-p
bind C-p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"

# Move tmux copy buffer into x clipboard
unbind C-y
bind C-y run "tmux save-buffer - | xclip -i"
