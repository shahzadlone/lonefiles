# Shahzad's Tmux Plugins.

# My tmux plugins dir (yes, I know this is the deafult one).
set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/plugins/'

# List of plugins and their configs.
#=============================================================================== Sensible
set -g @plugin 'tmux-plugins/tmux-sensible'

#============================================================================== Resurrect
set -g @plugin 'tmux-plugins/tmux-resurrect'
# Restore last saved environment automatically when tmux is started.
#set -g @continuum-restore 'on'

#============================================================================== Continuum
set -g @plugin 'tmux-plugins/tmux-continuum'
# Enable automatic start with systemd.
set -g @continuum-boot 'on'
# Restore last saved environment automatically when tmux is started.
set -g @continuum-restore 'on'

#======================================================================== PrefixHighlight
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
# Add the highlighting of the prefix to the right of the status bar,
set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'
# Set the colors used for the prefix highlight.
set -g @prefix_highlight_bg 'blue'

#=================================================================================== Yank
set -g @plugin 'tmux-plugins/tmux-yank'
# Allow yanking with mouse (this is also the default behaviour).
set -g @yank_with_mouse on
# Set yank selection from: 'primary' or 'secondary' or 'clipboard'.
set -g @yank_selection 'clipboard'
# Set yank selection of mouse from: 'primary' or 'secondary' or 'clipboard'.
set -g @yank_selection_mouse 'clipboard'

#==================================================================================== Open
set -g @plugin 'tmux-plugins/tmux-open'
# set -g @open-S 'https://www.google.com/search?q='

#==================================================================================== TPM
set -g @plugin 'tmux-plugins/tpm'
# Install plugin manger (tpm) if it isn't there.
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
# Initialize tmux plugin manager (this line should be at the very bottom).
run -b '~/.tmux/plugins/tpm/tpm'
