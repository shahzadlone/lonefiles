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
