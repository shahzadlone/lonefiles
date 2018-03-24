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

# Make a backup directory to store the dotfiles that have the same names / exist before.
mkdir -p .lonefiles_backup

# Try to see if the repository just works (has no conflicts).
lit checkout

if [ {$}? -eq 0 ]; then

    echo "No conflicts with previous files, lonefiles successfully cloned! =)";

else

    echo "Backing up pre-existing dotfiles that have same names as lonefiles.";
    lone checkout 2>&1 | egrep "\s+\." | awk {'print ${1}'} | xargs -I{} mv {} .lonefiles_backup/{};

    echo "Trying to install lonefiles after the backup...";
    lit checkout

    if [ {$}? -eq 0 ]; then
        echo "The lonefiles were successfully cloned after the backup! =)";

    else
        echo "Still unsuccessfull in cloning the lonefiles properly. =(";
        exit 123;

    fi

fi

# Set to only track the files that I have checked in the repository and ignore others.
lit config status.showUntrackedFiles no
