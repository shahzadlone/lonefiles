#!/bin/bash

#========================================================================================
# Shahzad's script that will configure the downloaded/installed/cloned files according
#  to my preference, and also change/configure any system specific preferences like
#  for example if I want to remap any keys, or use my own defined keyboard shortcuts.
#========================================================================================

THEME_DIR=$(printf "${HOME}/.themes");
DISTRO=$(lsb_release -d | awk -F"\t" '{print $2}' | cut -c -6)

# ====================[ Configure vim ]====================

# Install the plugins and quit all vim buffers that opened (can also do +qa).
vim +PlugInstall +qall

# Install/compile/configure the additional stuff for some plugins that require it.
~/.vim/plug/YouCompleteMe/install.py --clang-completer

# Just update the plugins and quit all vim buffers (probably don't need this step).
vim +PlugUpdate +qall

# ====================[ Configure terminal ]====================

# Install the gruv-box dark terminal theme from Mayccoll/Gogh.
source <(wget -O - "https://git.io/v7eBS");

# Source the .bashrc so everything takes effect.
source ~/.bashrc;

# Rough used for debugging, figure out what to do with this.
TERMINAL_NAME=$(ps -p $PPID | awk '{print substr($4,1,length-25)}' | tail -n 1);
printf "\nTerminalName=$TERMINAL_NAME\n";

# ====================[ Configure system ]====================
# Map the capslock to the control key.

