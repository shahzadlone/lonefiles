#!/bin/bash

#========================================================================================
# Shahzad's script that combines all other scripts to do the following:
#     1) Build all dependencies (packages), "lonependencies.sh".
#     2) Clone the dotfiles/lonefiles repository as a bare git repository, "lonestall.sh".
#     3) Configure / compile / install all the cloned lonefiles/dotfiles, "lonefigure.sh".
#========================================================================================

# Address to where my script files in raw format are stored online (dotfiles repo).
SCRIPTS_DIR='https://raw.githubusercontent.com/shahzadlone/lonefiles/distro-arch-linux/.scripts';

# 1) Clone the dotfiles as a bare git repository, with minimal dependencies.
sudo wget -O - "${SCRIPTS_DIR}/lonestall.sh" | sudo bash

# Exit if cloning was not successfull (lonestall.sh failed).
if ! [ ${?} -eq 0 ]; then

    echo "lonestall.sh wasn't successfull in cloning the lonefiles, lonify.sh exiting! =(";
    exit 111;

fi

# 2) Detect current distro of linux and install the appropriate dependencies.
sudo curl -skL "${SCRIPTS_DIR}/lonependencies.sh" | sudo bash

# At this point if lonestall.sh was successfull we should have the lonefiles locally.

# 3) Run the script that configures everything (vim plugins, terminal stuff, etc.)
source ~/.scripts/lonefigure.sh;

# Output the results and show if everything was successfull or not.
if [ ${?} -eq 0 ]; then

    echo "Everything lonified and set according to my preference! =)";

else

    echo "Something went wrong, not everything lonified! =(";

    exit 111;

fi
