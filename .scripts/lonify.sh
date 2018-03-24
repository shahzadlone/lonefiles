#!/bin/bash

#========================================================================================
# Shahzad's script that combines all other scripts to do the following:
#     1) Build all dependencies (packages), "lonependencies.sh".
#     2) Clone the dotfiles/lonefiles repository as a bare git repository, "lonestall.sh".
#     3) Configure / compile / install all the cloned lonefiles/dotfiles, "lonefigure.sh".
#========================================================================================

# Address to where my script files in raw format are stored online.
SCRIPTS_DIR='https://raw.githubusercontent.com/shahzadlone/lonefiles/master/.scripts/';

# 1) Run the basic apt get dependencies builder script.
curl -skL "${SCRIPTS_DIR}lonependencies.sh" | sudo bash
