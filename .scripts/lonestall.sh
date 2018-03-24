#!/bin/bash

#========================================================================================
# Shahzad's script that will clone all the lonefiles/dotfiles onto the system as a bare
#  git repository, and if there are any files that exist already that will conflict with
#  the lonefiles, then backs them up in a hidden directory called ".lonefiles_backup".
#========================================================================================

# Clone the lonefiles as a bare git repository.
git clone --bare https://github.com/shahzadlone/lonefiles ${HOME}/.lonefiles

function lit {
    \git --git-dir="${HOME}"/.lonefiles/ --work-tree="${HOME}" ${@};
}

