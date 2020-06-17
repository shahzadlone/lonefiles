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

# Ensure Coc.nvim extensions are updated if they weren't updated before.
vim +CocRestart +qall

yay -S neovim-remote

# install powerline fonts.
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# install fzf
sudo pacman -S fzf

# Install Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ====================[ Configure terminal ]====================

# Install the gruv-box dark terminal theme from Mayccoll/Gogh.
source <(wget -O - "https://git.io/v7eBS");

# Source the .bashrc so everything takes effect.
source ~/.bashrc;

# ====================[ Configure system ]====================

# Change the system's theme if using Ubuntu.
if [ ${DISTRO} == "Ubuntu" ]; then

    echo "Ubuntu detected, so installing the theme!";

    # Delete the already existing theme folder.
    sudo rm -rf "${THEME_DIR}";

    # Clone the theme into the .themes folder.
    git clone https://github.com/EliverLara/Ant.git "${THEME_DIR}";

    # Remove the .git folder from the theme folder.
    sudo rm -rf "${THEME_DIR}/.git";

    # Enable the theme.
    gsettings set org.gnome.desktop.interface gtk-theme "Ant"
    gsettings set org.gnome.desktop.wm.preferences theme "Ant"

fi

# Map the capslock to the control key.

# Rough used for debugging, figure out what to do with this.
TERMINAL_NAME=$(ps -p $PPID | awk '{print substr($4,1,length-25)}' | tail -n 1);
printf "\nTerminalName=$TERMINAL_NAME\n";
