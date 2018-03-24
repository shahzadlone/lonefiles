#!/bin/bash

#========================================================================================
# Shahzad's script that will configure the downloaded/installed/cloned files according
#  to my preference, and also change/configure any system specific preferences like
#  for example if I want to remap any keys, or use my own defined keyboard shortcuts.
#========================================================================================

# ====================[ Configure vim ]====================

# Install the plugins and quit all vim buffers that opened (can also do +qa).
vim +PlugInstall +qall

# Install/compile/configure the additional stuff for some plugins that require it.
~/.vim/plug/YouCompleteMe/install.py --clang-completer

# Just update the plugins and quit all vim buffers (probably don't need this step).
vim +PlugUpdate +qall

# ====================[ Configure terminal ]====================

# Clone the gnome terminal colors repository that will help us change our terminal theme.
git clone https://github.com/metalelf0/gnome-terminal-colors.git ~/temp_terminal_theme;

# Run the installation script and this is where we will interact with the script.
source ~/temp_terminal_theme/install.sh;

# After the user follows the on screen instructions and configuration is done, delete it.
rm -rf ~/temp_terminal_theme;

# Source the .bashrc so everything takes effect.
source ~/.bashrc
