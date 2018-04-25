#!/bin/bash

#========================================================================================
# Shahzad's script that will configure the downloaded/installed/cloned files according
#  to my preference, and also change/configure any system specific preferences like
#  for example if I want to remap any keys, or use my own defined keyboard shortcuts.
#========================================================================================

# ====================[ Configure vim ]====================

# Install the plugins and quit all vim buffers that opened (can also do +qa).
sudo vim +PlugInstall +qall

# Install/compile/configure the additional stuff for some plugins that require it.
~/.vim/plug/YouCompleteMe/install.py --clang-completer

# Just update the plugins and quit all vim buffers (probably don't need this step).
sudo vim +PlugUpdate +qall

# ====================[ Configure terminal ]====================

# Install the gruv-box dark terminal theme from Mayccoll/Gogh.
sudo wget -O - "https://git.io/v7eBS" | sudo bash; clear;

# Source the .bashrc so everything takes effect.
source ~/.bashrc

# ====================[ Configure system ]====================
# Map the capslock to the control key.

