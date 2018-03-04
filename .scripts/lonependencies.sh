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

InstallBazel() {
    local PACKAGE="${HashMapOfPackages[Bazel]}";

    # Install JDK 8
    Download "openjdk-8-jdk";

    # Add bazel's distro
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" \
        | sudo tee /etc/apt/sources.list.d/bazel.list;
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add -;

    # Update, install and upgrade bazel.
    Update && Download "${PACKAGE}" && Upgrade "${PACKAGE}";

    echo -e "[ BAZEL INSTALLATION DONE ]\n";
}

InstallKcov() {
    local PACKAGE="${HashMapOfPackages[Kcov]}";

    # Create temporary path for kcov installation.
    local TEMP_KCOV_DIR=$(mktemp -t -d kcov-XXXX --suffix=_install_temp);

    # Install all the packages that kcov requires.
    Download "cmake";
    Download "libcurl4-openssl-dev";
    Download "libdw-dev";
    Download "libiberty-dev";
    Download "binutils-dev";
    Download "zlib1g-dev";

    # Go to that temporary path.
    cd ${TEMP_KCOV_DIR};

    # Get the kcov source code from the git repository.
    git clone https://github.com/SimonKagstrom/kcov.git kcov-source;

    # Make a build directory and go to it.
    mkdir kcov-build && cd kcov-build;

    # Configure, build and then install kcov from source.
    cmake ../kcov-source && make && make install;

    # Remove the temporary path we made for kcov installation.
    cd ${THIS_SCRIPT_DIR};
    rm -rf ${TEMP_KCOV_DIR};

    # Print where kov was installed (if it was installed that is).
    echo -ne "kcov installed at this path: $(which "${PACKAGE}")\n";
    echo -ne "kcov version now is: $("${PACKAGE}" --version)\n";
    echo -e "[==== KCOV INSTALLATION DONE ====]\n";
}

InstallAll() {
    # Make sure the user is root
    if [ $(whoami) != "root" ]; then
        echo "ERROR: not root! (run the install script again using sudo)" >&2;
        exit -1;
    fi

    # Show what packages we have before the installation began.
    echo -e "Packages you already have installed on your system:\n";
    PrintCurrentPackages;

    # Install all the packages.
    for package in "${!HashMapOfPackages[@]}"; do
        local PACKAGE_ALREADY_EXISTS=$(Exists "${HashMapOfPackages[${package}]}";);

        if [ "${PACKAGE_ALREADY_EXISTS}" -eq 0 ]; then
            printf "${CYAN_COLOR}";
            printf "==================================================================\n";
            printf "************[ NOTE: ${package} is already installed! ]************\n";
            printf "==================================================================\n";
            printf "${NO_COLOR}";
        else
            printf "${YELLOW_COLOR}";
            printf "==================================================================\n";
            printf "*********************[ Installing ${package} ]********************\n";
            printf "==================================================================\n";
            printf "${BLUE_COLOR}";
            Install"${package}";
            printf "${NO_COLOR}";
        fi
    done

    # Show what packages we now have, to check if all packages got installed properly.
    echo -e "Check if now you have all packages installed:\n";
    PrintCurrentPackages;
}
}

