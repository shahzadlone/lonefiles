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
                               ["PackageConfig"]="pkg-config"
                               ["CMake"]="cmake"
                               ["Gdb"]="gdb"
                               ["Vim"]="vim"
                               ["Emacs"]="emacs25"
                               ["Tmux"]="tmux"
                               ["Doxygen"]="doxygen"
                               ["Valgrind"]="valgrind"
                               ["Okular"]="okular"
                               ["ImageViewer"]="feh"
                               ["Python3"]="python3"
                               ["VirtualBox"]="virtualbox"
                               ["Tree"]="tree"
                               ["EncFs"]="gnome-encfs-manager"
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

InstallPackageConfig() { Download "${HashMapOfPackages[PackageConfig]}"; }

InstallCMake() { Download "${HashMapOfPackages[CMake]}"; }

InstallGdb() { Download "${HashMapOfPackages[Gdb]}"; }

InstallVim() { Download "${HashMapOfPackages[Vim]}"; }

InstallEmacs() { Download "${HashMapOfPackages[Emacs]}"; }

InstallTmux() { Download "${HashMapOfPackages[Tmux]}"; }

InstallDoxygen() { Download "${HashMapOfPackages[Doxygen]}"; }

InstallValgrind() { Download "${HashMapOfPackages[Valgrind]}"; }

InstallOkular() { Download "${HashMapOfPackages[Okular]}"; }

InstallImageViewer() { Download "${HashMapOfPackages[ImageViewer]}"; }

InstallPython3() { Download "${HashMapOfPackages[Python3]}"; }

InstallVirtualBox() { Download "${HashMapOfPackages[VirtualBox]}"; }

InstallTree() { Download "${HashMapOfPackages[Tree]}"; }

InstallEncFs() {
    # Add the PPA for Encfs.
    AddRep "ppa:gencfsm";
    # Update.
    Update;
    # Install EncFs.
    Download "${HashMapOfPackages[EncFs]}";
}

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

    # Install bazel's dependencies to build from source (might have them before).
    SilentDownload "g++";
    SilentDownload "zlib1g-dev";
    SilentDownload "pkg-config";
    SilentDownload "build-essential";
    SilentDownload "openjdk-8-jdk";
    SilentDownload "python";
    SilentDownload "zip";
    SilentDownload "unzip";
    SilentDownload "jq";

    # Address to the latest release of bazel on github's api (api.github.com).
    local BAZEL_RELEASE_URL='bazelbuild/bazel/releases/latest';

    # Use JSON processor (jq) and gitapi to build the download url to the latest release.
    local BAZEL_DOWNLOAD_URL=$( \
        curl -s "https://api.github.com/repos/${BAZEL_RELEASE_URL}" \
             | jq -r ".assets[] | select(.name | test(\"-dist.zip\")) | .browser_download_url" \
             | head -1);

    # Create temporary path for bazel installation.
    local TEMP_BAZEL_DIR=$(mktemp -t -d bazel-XXXX --suffix=_lonestall_temp);

    # Go to that temporary path.
    cd ${TEMP_BAZEL_DIR};

    # Download the latest bazel release right here (from the download url we built).
    wget "${BAZEL_DOWNLOAD_URL}";

    # Unzip the downloded bazel release 
    unzip *;

    # Run the compiling script that builds bazel from scratch.
    ./compile.sh;

    # Remove the temporary path we made for bazel installation.
    cd ${THIS_SCRIPT_DIR};
    rm -rf ${TEMP_BAZEL_DIR};

    echo -e "[ BAZEL INSTALLATION DONE ]\n";
}

InstallKcov() {
    local PACKAGE="${HashMapOfPackages[Kcov]}";

    # Install all the packages that kcov requires.
    SilentDownload "pkg-config";
    SilentDownload "cmake";
    SilentDownload "python-minimal";
    SilentDownload "libcurl4-openssl-dev";
    SilentDownload "libdw-dev";
    SilentDownload "libiberty-dev";
    SilentDownload "binutils-dev";
    SilentDownload "zlib1g-dev";

    # Create temporary path for kcov installation.
    local TEMP_KCOV_DIR=$(mktemp -t -d kcov-XXXX --suffix=_lonestall_temp);

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

        # To space out nicely.
        printf "\n";

    done

    # Show what packages we now have, to check if all packages got installed properly.
    echo -e "Check if now you have all the main packages installed:\n";
    PrintCurrentPackages;
}

# Most of these packages either add more functionality to the hashmap ones, or 
#  are not checkable by the ``which`` and ``command -v`` to see if they exist or not.
InstallExtra() {
    printf "${YELLOW_COLOR}";
    printf "Now installing some extra goodies to extend onto our normal packages..."

    SilentDownload "texlive-full";
    SilentDownload "myspell-en-gb";
    SilentDownload "python3-pip";
    SilentDownload "python-dev";
    SilentDownload "python3-dev";
    SilentDownload "python-minimal";
    SilentDownload "virtualbox-ext-pack";
    SilentDownload "mono-devel";
    SilentDownload "vim-gnome";
    SilentDownload "dconf-cli";
    SilentDownload "build-essential";

    printf " DONE!! =)\n"
    printf "${NO_COLOR}";
}

#========================================================================================
# Script Execution.
#========================================================================================

# Run the function that will install all the main hashmap packages.
InstallAll;

# Run the function that will install the extra, additional packages.
InstallExtra ;

#========================================================================================
# End.
#========================================================================================

printf "\n${BLUE_COLOR}Finished building all dependencies.${NO_COLOR}\n\n";
