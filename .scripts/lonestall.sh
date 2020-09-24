#!/bin/bash

#========================================================================================
# Shahzad's script that will clone all the lonefiles/dotfiles onto the system as a bare
#  git repository, and if there are any files that exist already that will conflict with
#  the lonefiles, then backs them up in a hidden directory called ".lonefiles_backup".
#========================================================================================

#========================================================================================
# Helper Variables
#========================================================================================

LONEFILES_DIR=$(printf "${HOME}/.lonefiles");

LONE_BACKUP_DIR=$(printf "${LONEFILES_DIR}_backup");

COMMON_DEPS=$(printf "wget git curl grep");

# Variable to help us detect the distro of linux we are on.
DISTRO=$(cat /etc/os-release | grep "^NAME" | cut -c 6- | cut -d "\"" -f 2);
if [ "$(uname)" == "Darwin" ]; then
    DISTRO="Mac";
fi

#========================================================================================
# Helper Functions.
#========================================================================================

Lit() {
    sudo \git --git-dir="${LONEFILES_DIR}" --work-tree="${HOME}" ${@};
}

Move() {
    sudo mkdir -p "${2}/"$(dirname "${1}") && sudo mv "${1}" "${2}/${1}";
}

Apt() { sudo DEBIAN_FRONTEND=noninteractive apt-get ${1} -y \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confnew" ${2};
}

#========================================================================================
# Script Execution.
#========================================================================================

printf "\n========== Detected Linux Distribution: ${DISTRO} ==========\n";

if [ "${DISTRO}" == "Arch Linux" ] || [ "${DISTRO}" == "Manjaro Linux" ]; then
    sudo pacman -Sy --needed --noconfirm ${COMMON_DEPS};

elif [ "${DISTRO}" == "Ubuntu" ]; then
    Apt 'install --show-progress --verbose-versions' "${COMMON_DEPS}";

elif [ "${DISTRO}" == "Mac" ]; then
    brew install ${COMMON_DEPS};

else
    printf "\nWARNING: Distribution=${DISTRO} not supported by ${0} yet ...\n";
    printf "\n... But lets try anyways! ...\n";
fi

# Clone the lonefiles as a bare git repository only if they are not there before.
if [ ! -d "${LONEFILES_DIR}" ]; then

    git clone --bare https://github.com/shahzadlone/lonefiles "${LONEFILES_DIR}";

    # Try to see if the repository just works (has no conflicts).
    Lit checkout;

    if [ ${?} -eq 0 ]; then

        echo "No conflicts with previous files, lonefiles successfully cloned! =)";

    else

        echo "Backing up pre-existing files that have same names as lonefiles.";

        BACKUP_FILES=$(Lit checkout 2>&1 | egrep "^\s" | awk {'print $1'} | xargs echo);

        printf "These are the files we need to back up:\n${BACKUP_FILES}\n";

        # Make a backup directory to store the dotfiles that exist before.
        sudo mkdir -p "${LONE_BACKUP_DIR}/";

        # Make all required paths and move all the files that need to be backed up.
        for file in ${BACKUP_FILES}; do Move "${HOME}/${file}" "${LONE_BACKUP_DIR}"; done

        echo "Trying to install lonefiles after the backup...";
        Lit checkout;

        if [ ${?} -eq 0 ]; then

            echo "The lonefiles were successfully cloned after the backup! =)";

        else

            echo "Still unsuccessfull in cloning the lonefiles properly. =(";
            exit 22;

        fi

    fi

    # Only track the files that I have in the bare repository and ignore others.
    Lit config status.showUntrackedFiles no

else

    echo "[${LONEFILES_DIR}] Already exists, so no need to install again.";

fi

#========================================================================================
# Post Installation - Fix File Permissions.
#========================================================================================

# Fix file permisions of all the tracked lonefiles (pushed in the repository).
while read file; do
    sudo chmod -R 777 "${file}";
done < <(Lit ls-tree --name-only HEAD "${HOME}");

# Fix file permisions of the bare repo file (~/.lonefiles), and the backup directory.
sudo chmod -R 777 "${LONEFILES_DIR}" "${LONE_BACKUP_DIR}";

#========================================================================================
# End.
#========================================================================================
