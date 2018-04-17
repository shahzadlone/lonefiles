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
                               ["G++"]="g++"
                               ["JsonProcessor"]="jq"
                               ["Zip"]="zip"
                               ["UnZip"]="unzip"
                               ["Okular"]="okular"
                               ["ImageViewer"]="feh"
                               ["Python3"]="python3"
                               ["VirtualBox"]="virtualbox"
                               ["Tree"]="tree"
                               ["CTags"]="ctags"
                               ["CScope"]="cscope"
                               ["Git"]="git"
                               ["GitLargeFileStorage"]="git-lfs"
                               ["EncFs"]="gnome-encfs-manager"
                               ["Pinta"]="pinta"
                               ["Bazel"]="bazel"
                               ["Kcov"]="kcov" );

#========================================================================================
# Helper Functions.
#========================================================================================

Download() { sudo apt-get install -y --show-progress --verbose-versions "${1}"; }

SilentDownload() { sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
                   -o Dpkg::Options::="--force-confdef" \
                   -o Dpkg::Options::="--force-confnew" "${1}" 2>&1 > /dev/null; }

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

InstallG++() { Download "${HashMapOfPackages[G++]}"; }

InstallJsonProcessor() { Download "${HashMapOfPackages[JsonProcessor]}"; }

InstallZip() { Download "${HashMapOfPackages[Zip]}"; }

InstallUnZip() { Download "${HashMapOfPackages[UnZip]}"; }

InstallOkular() { Download "${HashMapOfPackages[Okular]}"; }

InstallImageViewer() { Download "${HashMapOfPackages[ImageViewer]}"; }

InstallPython3() { Download "${HashMapOfPackages[Python3]}"; }

InstallVirtualBox() { Download "${HashMapOfPackages[VirtualBox]}"; }

InstallTree() { Download "${HashMapOfPackages[Tree]}"; }

InstallCTags() { Download "${HashMapOfPackages[CTags]}"; }

InstallCScope() { Download "${HashMapOfPackages[CScope]}"; }

InstallGit() { Download "${HashMapOfPackages[Git]}"; }

InstallGitLargeFileStorage() {
    Download "software-properties-common";

    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh \
         | sudo bash;

    Download "${HashMapOfPackages[GitLargeFileStorage]}";
}

InstallEncFs() {
    # Add the PPA for Encfs.
    AddRep "ppa:gencfsm";

    # Update (don't need to do this in Ubuntu 18.04).
    Update;

    # Install EncFs.
    Download "${HashMapOfPackages[EncFs]}";
}

InstallPinta() {
    # Add the PPA for pinta.
    AddRep "ppa:pinta-maintainers/pinta-stable";

    # Update (don't need to do this in Ubuntu 18.04).
    Update;

    # Install pinta.
    Download "${HashMapOfPackages[Pinta]}";
}

InstallBazel() {
    local PACKAGE="${HashMapOfPackages[Bazel]}";

    # Install bazel's dependencies to build from source (might have them before).
    SilentDownload "zlib1g-dev";
    SilentDownload "pkg-config";
    SilentDownload "build-essential";
    SilentDownload "openjdk-8-jdk";

    # Add bazel's distro and key.
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" \
         | sudo tee /etc/apt/sources.list.d/bazel.list;
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add -;

    # Update, install and upgrade bazel.
    Update; Download "${PACKAGE}"; Upgrade "${PACKAGE}";

    # Print where bazel was installed (if it was installed that is).
    echo -ne "bazel installed at this path: $(which "${PACKAGE}")\n";
    echo -ne "bazel version now is: $("${PACKAGE}" --version)\n";
    echo -e "[==== BAZEL INSTALLATION DONE ====]\n";
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

        echo "ERROR: not root! (try lonestalling the script using sudo)." >&2;
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

    printf "Installed 1..."

    SilentDownload "hunspell-en-ca";

    printf "Installed 2..."

    SilentDownload "python3-pip";

    printf "Installed 3..."

    SilentDownload "python-dev";

    printf "Installed 4..."

    SilentDownload "python3-dev";

    printf "Installed 5..."

    SilentDownload "python-minimal";

    printf "Installed 6..."

    SilentDownload "virtualbox-ext-pack";

    printf "Installed 7..."

    SilentDownload "mono-devel";

    printf "Installed 8..."

    SilentDownload "vim-gnome";

    printf "Installed 9..."

    SilentDownload "dconf-cli";

    printf "Installed 10..."

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


#========================================================================================
# Rough stuff that I should figure out what to do with.
#========================================================================================

# Incase we ever want to install the latest bazel release from source.
# InstallBazelFromScratch() {
#     local PACKAGE="${HashMapOfPackages[Bazel]}";
# 
#     # Install bazel's dependencies to build from source (might have them before).
#     SilentDownload "g++";
#     SilentDownload "zlib1g-dev";
#     SilentDownload "pkg-config";
#     SilentDownload "build-essential";
#     SilentDownload "openjdk-8-jdk";
#     SilentDownload "python";
#     SilentDownload "zip";
#     SilentDownload "unzip";
#     SilentDownload "jq";
# 
#     # Address to the latest release of bazel on github's api (api.github.com).
#     local BAZEL_RELEASE_URL='bazelbuild/bazel/releases/latest';
# 
#     # Use JSON processor (jq) and gitapi to build the download url to the latest release.
#     local BAZEL_DOWNLOAD_URL=$( \
#         curl -s "https://api.github.com/repos/${BAZEL_RELEASE_URL}" \
#              | jq -r ".assets[] | select(.name | test(\"-dist.zip\")) | .browser_download_url" \
#              | head -1);
# 
#     # Create temporary path for bazel installation.
#     local TEMP_BAZEL_DIR=$(mktemp -t -d bazel-XXXX --suffix=_lonestall_temp);
# 
#     # Go to that temporary path.
#     cd ${TEMP_BAZEL_DIR};
# 
#     # Download the latest bazel release right here (from the download url we built).
#     wget "${BAZEL_DOWNLOAD_URL}";
# 
#     # Unzip the downloded bazel release 
#     unzip *;
# 
#     # Run the compiling script that builds bazel from scratch.
#     ./compile.sh;
# 
#     # Remove the temporary path we made for bazel installation.
#     cd ${THIS_SCRIPT_DIR};
#     rm -rf ${TEMP_BAZEL_DIR};
# 
#     echo -e "[ BAZEL INSTALLATION DONE ]\n";
# }
