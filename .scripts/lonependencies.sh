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
