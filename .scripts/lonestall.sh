#!/bin/bash

#========================================================================================
# Shahzad's script that will clone all the lonefiles/dotfiles onto the system as a bare
#  git repository, and if there are any files that exist already that will conflict with
#  the lonefiles, then backs them up in a hidden directory called ".lonefiles_backup".
#========================================================================================

lit() {
    sudo \git --git-dir="${HOME}/.lonefiles" --work-tree="${HOME}" ${@};
}

# Clone the lonefiles as a bare git repository only if they are not there before.
if [ ! -d "${HOME}/.lonefiles" ]; then

    git clone --bare https://github.com/shahzadlone/lonefiles "${HOME}/.lonefiles";

    # Make a backup directory to store the dotfiles that have the same names / exist before.
    sudo mkdir -p "${HOME}/.lonefiles_backup";

    # Try to see if the repository just works (has no conflicts).
    lit checkout;

    if [ ${?} -eq 0 ]; then

        echo "No conflicts with previous files, lonefiles successfully cloned! =)";

    else

        echo "Backing up pre-existing dotfiles that have same names as lonefiles.";
        lit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} \
            | xargs -I{} mv {} .lonefiles_backup/{};

        echo "Trying to install lonefiles after the backup...";
        lit checkout;

        if [ ${?} -eq 0 ]; then

            echo "The lonefiles were successfully cloned after the backup! =)";

        else

            echo "Still unsuccessfull in cloning the lonefiles properly. =(";
            exit 123;

        fi

    fi

    # Only track the files that I have in the bare repository and ignore others.
    lit config status.showUntrackedFiles no

else

    echo "~/.lonefiles Already exists, so no need to install again.";

fi
