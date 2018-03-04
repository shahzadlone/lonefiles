#!/bin/bash

#========================================================================================
# Shahzad's script to install and build all the dependency packages. This script 
#  can also be used to see if the main dependencies are installed on the system
#  or not. Hence the name "lonependencies.sh" (dependencies/packages builder).
#========================================================================================

#========================================================================================
# Helper Variables
#========================================================================================

THIS_SCRIPT_DIR=$(dirname ${0});

# Some variables for color printing.
RED_COLOR='\033[1;31m';
GREEN_COLOR='\033[1;32m';
CYAN_COLOR='\033[1;36m';
BLUE_COLOR='\033[1;34m';
YELLOW_COLOR='\033[1;33m';
NO_COLOR='\033[0m';

declare -A HashMapOfPackages=( ["Curl"]="curl"
                               ["Gdb"]="gdb"
                               ["Vim"]="vim"
                               ["Tmux"]="tmux"
                               ["Doxygen"]="doxygen"
                               ["Valgrind"]="valgrind"
                               ["Okular"]="okular"
                               ["Python3"]="python3"
                               ["Pinta"]="pinta"
                               ["Git"]="git"
                               ["GitLargeFileStorage"]="git-lfs"
                               ["Bazel"]="bazel"
                               ["Kcov"]="kcov" );

#========================================================================================
# Helper Functions.
#========================================================================================

Download() { sudo apt-get install -y --show-progress --verbose-versions "${1}"; }

SilentDownload() { sudo apt-get install -y "${1}" 2>&1 > /dev/null; }

AddRep() { sudo add-apt-repository -y "${1}"; }

Upgrade() { sudo apt-get upgrade -y "${1}"; }

Update() { sudo apt-get update -y; }

Exists() { which "${1}" 2>&1 > /dev/null; echo ${?}; }

# Show what packages from the hash map do we have installed on our system currently.
PrintCurrentPackages() {
    printf "[ ${GREEN_COLOR}Green${NO_COLOR} means installed, and ";
    printf "${RED_COLOR}Red${NO_COLOR} means not installed. ]\n";
    printf "Packages:\n\n"

    for package in "${!HashMapOfPackages[@]}"; do
        local PACKAGE_THERE=$(Exists "${HashMapOfPackages[${package}]}";);

        if [ "${PACKAGE_THERE}" -eq 0 ]; then
            printf "${GREEN_COLOR}${package}${NO_COLOR}\n";

        else
            printf "${RED_COLOR}${package}${NO_COLOR}\n";

        fi

    done

    printf "\n"
}

#========================================================================================
# Installing Functions.
#========================================================================================

InstallCurl() { Download "${HashMapOfPackages[Curl]}"; }

InstallGdb() { Download "${HashMapOfPackages[Gdb]}"; }

InstallVim() { Download "${HashMapOfPackages[Vim]}"; }

InstallTmux() { Download "${HashMapOfPackages[Tmux]}"; }

InstallDoxygen() { Download "${HashMapOfPackages[Doxygen]}"; }

InstallValgrind() { Download "${HashMapOfPackages[Valgrind]}"; }

InstallOkular() { Download "${HashMapOfPackages[Okular]}"; }

InstallSpellCheck() { Download "${HashMapOfPackages[SpellCheck]}"; }

InstallPinta() {
    # Add the PPA for pinta.
    AddRep "ppa:pinta-maintainers/pinta-stable";
    # Update.
    Update;
    # Install pinta.
    Download "${HashMapOfPackages[Pinta]}";
}

InstallGit() { Download "${HashMapOfPackages[Git]}"; }

InstallGitLargeFileStorage() {
    Download "software-properties-common";
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh \
         | sudo bash;
    Download "${HashMapOfPackages[GitLargeFileStorage]}";
}
