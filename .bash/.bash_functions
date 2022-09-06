# Shahzad's Bash Functions.

# My color helper functions.
MAGENTA() { echo -e "\e[1;35m${1}\e[0m"; }
YELLOW() { echo -e "\e[1;33m${1}\e[0m"; }
GREEN() { echo -e "\e[1;32m${1}\e[0m"; }
BLACK() { echo -e "\e[1;30m${1}\e[0m"; }
BLUE() { echo -e "\e[1;34m${1}\e[0m"; }
CYAN() { echo -e "\e[1;36m${1}\e[0m"; }
GRAY() { echo -e "\e[1;90m${1}\e[0m"; }
RED() { echo -e "\e[1;31m${1}\e[0m"; }

# Make a directory and cd into it.
cdm() {
    mkdir -p -- "${1}" && cd -P -- "${1}";
}

# Open graphically the selected directory or location.
o() {
    if [ ${#} -eq 0 ]; then
        xdg-open .;
    else
        xdg-open "${@}";
    fi
}

# Determine size of a file or total size of a directory.
fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local ARGUMENT=-sbh;
    else
        local ARGUMENT=-sh;
    fi
    if [[ -n "${@}" ]]; then
        du ${ARGUMENT} -- "${@}";
    else
        du ${ARGUMENT} .[^.]* ./*;
    fi
}

# Copy the contents of the given file to the clipboard (xclip).
Copy() {
    xclip -selection clipboard < "${1}";
}

# Paste the contents of the clipboard (xclip) into a file.
Paste() {
    xclip -out -selection clipboard >> "${1}";
}

# I can now do `Mark IWASTHERE` and just `cd ${IWASTHERE}` to go to that marked dir.
Mark() {
    export ${1}=`pwd`;
}

# If the directory has a Makefile with `EXEC = bin`, this function returns bin. Helpful
#  when in my vim's vimux mapping I just want to run "make && ./`BINAME`" to quickly
#  make the binary using the makefile and then run the created executable(bin).
BINAME() {
    cat Makefile | \grep 'EXEC = ' | tr -s ' ' | cut -d' ' -f3;
}

CloneAll() {
    # Make the url of the input github organization's repository page (200 max).
    ORG_URL="https://api.github.com/orgs/${1}/repos?per_page=200";

    # List of all repositories of that organization (seperated by newline-eol).
    ALL_REPOS=$(curl -s ${ORG_URL} | grep html_url | awk 'NR%2 == 0' \
        | cut -d ':' -f 2-3 | tr -d '",');

    # Clone all the repositories.
    for ORG_REPO in ${ALL_REPOS}; do
        git clone ${ORG_REPO}.git;
    done
}

# Execute a script by using curl to pass the script's text on to bash.
BashCurl() {
    sudo curl -skL "${1}" | sudo bash;
}

# Execute a script by using wget to pass the script's text on to bash.
BashWget() {
    sudo wget -O - "${1}" | sudo bash;
}

Download() {
    wget -nc -k -np --random-wait -r -p -E -e robots=off -U mozilla ${1};
}

DownloadAll() {
    wget -nc -k --random-wait -r -p -E -e robots=off -U mozilla ${1};
}

DownloadSecure() {
    wget --user ${1} --password ${2} -nc -k -np --random-wait -r -p -E -e robots=off -U mozilla ${3};
}

DownloadAllSecure() {
    wget --user ${1} --password ${2} -nc -k --random-wait -r -p -E -e robots=off -U mozilla ${3};
}

DownloadYT() {
    youtube-dl --playlist-start 1 ${1};
}

DownloadYTMp3() {
    youtube-dl --extract-audio --audio-format mp3 --playlist-start 1 ${1};
}

YoutubeUpdate() {
    sudo apt autoremove youtube-dl;
    sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/bin/youtube-dl;
    sudo chmod a+rx /usr/bin/youtube-dl;
    youtube-dl --version;
}

BazelUpdate() {
    sudo apt-get install --only-upgrade bazel;
}

WioUpdate() {
    # Uninstall wio globally.
    sudo npm uninstall wio -g;

    # Install wio globally.
    sudo npm install wio --unsafe-perm -g;
}

AddAptKey() {
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "${1}";
}

wmClass() {
    xprop WM_CLASS;
}

procInfo() {
    ps aux | grep $(xprop | awk -F'='  '/PID/ {print $2}');
}

# Helper function to find the name of out process.
procParent() {
    basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat \
                  | cut -d \  -f 4) | tail -1 | sed 's/^.* //');

    # For fish
    # basename "/"(ps -f -p (cat /proc/(echo %self)/stat | cut -d \  -f 4) | tail -1 | sed 's/^.* //')
}

findProc() {
    ps -ef | grep "${1}";
}

findNodeProc() {
    #ps -ef | grep node;
    ps aux | grep node;
}

findPort() {
    lsof -i :"${1}";
}

F() {
    old="${IFS}";
    IFS=' ';
    allArgs=$*;
    IFS="${old}";

    # Selected files and folders
    selected="$(fzf -m)"
    echo "${selected}" | xargs ${allArgs};
}

npmm () {
    npm run $(jq -r '.scripts | keys[]' package.json | fzf --height=10);
}

gch () {
    git branch | fzf | xargs git checkout;
}

# dbproxy () {
#     # local ENVIRONMENTS=("staging" "production")
#     # local FZF_STRING=$(join_by "\n" "${ENVIRONMENTS[@]}")
#     local FZF_STRING="staging\nproduction";
#     local SELECTED_ENV=$(echo ${FZF_STRING} | fzf)
#     if [ "$SELECTED_ENV" = "staging" ]
#     then
#         echo "> Running staging proxy"
#         ~/cloud_sql_proxy -instances=caribou-staging-303716:us-east1:caribou-staging=tcp:3306
#     elif [ "$SELECTED_ENV" = "production" ]
#     then
#         echo "> Running prod proxy"
#         ~/cloud_sql_proxy -instances=caribou-production:us-east1:caribou-production=tcp:3306
#     else
#         echo "> unrecognized env selected"
#         return 123
#     fi
# }

fixCaribouDocker () {
    sudo docker rm caribou-db;
    fixDockerMountpoint;
    docker run -p 8889:3306 --name caribou-db -e MYSQL_ROOT_PASSWORD=root -d mysql:8.0;
}

dbprisma () {
    DATABASE_URL=mysql://root:<ROOT_PASSWORD>@localhost:3306/caribou npx prisma migrate deploy
}

RestartAudio() {
    pulseaudio -k;
    pulseaudio --start;
}

RecordAudio() {
    arecord -f cd -d 10 recorded_audio.wav;
}

RecordAudioOfLength() {
    arecord -f cd -d "${1}" "recorded_audio_of_length_${1}.wav";
}

TestMic() {
    arecord -vvv -f dat /dev/null;
}

TestGPU() {
    glxgears;
}

TestColor() {
    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }';
}

fixDockerMountpoint() {
    sudo mkdir /sys/fs/cgroup/systemd;
    sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd;
}

isDockerAbleToRestart() {
    docker inspect -f "{{.HostConfig.RestartPolicy.Name}}" ${1};
}

checkKittyFont() {
    kitty + list-fonts --psnames | grep "${1}";
}

sqlDump() {
    read -p "Database Username: " DB_USERNAME;
    DB_USERNAME=${DB_USERNAME:-root};

    read -p "Database Password: " DB_PASSWORD;
    DB_PASSWORD=${DB_PASSWORD:-root};

    read -p "Database Port: " DB_PORT;
    DB_PORT=${DB_PORT:-8889};
    # DB_PORT=${DB_PORT:-3306};

    read -p "Dump Filename: " DUMP_FILE;
    DUMP_FILE="${DUMP_FILE:-mysqldump_file}_$(date '+%d-%m-%Y_%H-%M-%S').sql";

    GREEN "\nRunning mysqldump...\n";

    # See if the command will be successfull.
    mysqldump "-P${DB_PORT}" "-u${DB_USERNAME}" "-p${DB_PASSWORD}" \
        --protocol=TCP --single-transaction --quick --lock-tables=false --all-databases;

    if [ ${?} -ne 0 ]; then
        RED "\nCouldn't do a mysqldump with following information:";
        YELLOW "  Username: ${DB_USERNAME}";
        YELLOW "  Password: ${DB_PASSWORD}";
        YELLOW "  Port: ${DB_PORT}\n";
        return 123;

    else
        # Actually dump it.
        mysqldump "-P${DB_PORT}" "-u${DB_USERNAME}" "-p${DB_PASSWORD}" \
            --protocol=TCP --single-transaction --quick --lock-tables=false \
            --all-databases > "${DUMP_FILE}";
        BLUE "\nSuccessfully dumped to ${DUMP_FILE}\n";
    fi
}

sqlRestore() {
    read -p "Database Username: " DB_USERNAME;
    DB_USERNAME=${DB_USERNAME:-root};

    read -p "Database Password: " DB_PASSWORD;
    DB_PASSWORD=${DB_PASSWORD:-root};

    read -p "Database Port: " DB_PORT;
    DB_PORT=${DB_PORT:-8889};
    # DB_PORT=${DB_PORT:-3306};

    GREEN "\nRestoring database(s) from: [${1}]...\n";

    mysql "-P${DB_PORT}" "-u${DB_USERNAME}" "-p${DB_PASSWORD}" --protocol=TCP < "${1}";

    if [ ${?} -ne 0 ]; then
        RED "\nCouldn't restore from the dump (see above). Given:";
        YELLOW "  Dump File: ${1}";
        YELLOW "  Username: ${DB_USERNAME}";
        YELLOW "  Password: ${DB_PASSWORD}";
        YELLOW "  Port: ${DB_PORT}\n";
        return 123;

    else
        BLUE "Successfully restored the database.\n";
    fi
}

Stream() {
    wget "${1}" -O- | tee myfav.mp4 | mpv --force-seekable=yes -;
}

TrimFrom() {
    ffmpeg -i "${1}" -ss "${2}" -c copy "trimmed_${1}";
}

TrimTo() {
    ffmpeg -i "${1}" -to "${2}" -c copy "trimmed_${1}";
}

TrimFromTo() {
    ffmpeg -i "${1}" -ss "${2}" -to "${3}" -c copy "trimmed_${1}";
}

# Source these files if they exist .bash_profile, .profile, .bashrc, tmux.conf.
sob() {
    if [ -f ~/.bash_profile ]; then
        source ~/.bash_profile > /dev/null;
    fi

    if [ -f ~/.profile ]; then
        source ~/.profile > /dev/null;
    fi

    if [ -f ~/.bashrc ]; then
        source ~/.bashrc;
    fi

    if [ -f ~/.tmux.conf ]; then
        tmux source-file ~/.tmux.conf;
    fi
}

# Helps delete (or force delete if user consents), the branches which still exist
#  locally but were merged in the remote repository.
GitSyncBranches(){

    git fetch --prune;

    if [ ${?} -ne 0 ]; then
        printf "\nSomething went wrong while doing 'git fetch --prune'\n";
        return 123;
    fi

    BRANCHES=$(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads \
             | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}');

    if [ -z "${BRANCHES}" ]; then
        MAGENTA "You are already in sync.";
        return 0;
    fi

    MAGENTA "Branches that are out of sync (will be deleted):";
    for branch in ${BRANCHES}; do
        RED "  - ${branch}";
    done

    MAGENTA "\nBy the way, you are currently on this branch:";
    GREEN "  * $(git branch --show-current)\n";
    read -p "Are you sure you want to delete all these branches? [y/n]: " DELETE_BRANCHES;

    if [ "${DELETE_BRANCHES}" != "${DELETE_BRANCHES#[Yy]}" ]; then
        for branch in ${BRANCHES}; do
            git branch -d ${branch};

            if [ ${?} -ne 0 ]; then

                RED "  Couldn't delete this branch: ${branch}\n";
                read -p "Would you like to try force delete(-D)? [y/n]: " DELETE_A_BRANCH;

                if [ "${DELETE_A_BRANCH}" != "${DELETE_A_BRANCH#[Yy]}" ]; then
                    git branch -D ${branch};

                    if [ ${?} -ne 0 ]; then
                        RED "  Couldn't even force delete this branch: ${branch}\n";
                    else
                        BLUE "  Successfully force deleted(-D): ${branch}\n"
                    fi

                else
                    BLUE "Ok, we will skip this branch.\n"
                fi

            else
                BLUE "Successfully deleted(-d): ${branch}\n"
            fi

        done

    else
        BLUE "Ok, no branches were deleted.\n"
    fi
}

GitPullAllBranches() {
    REMOTES="$@";

    if [ -z "$REMOTES" ]; then
        REMOTES=$(git remote);
    fi

    REMOTES=$(echo "${REMOTES}" | xargs -n1 echo);
    CLB=$(git rev-parse --abbrev-ref HEAD);

    echo "${REMOTES}" | while read REMOTE; do

    git remote update ${REMOTE};
    git remote show ${REMOTE} -n | awk '/merges with remote/{print $5" "$1}' | \

        while read RB LB; do

            ARB="refs/remotes/${REMOTE}/${RB}";
            ALB="refs/heads/${LB}";
            NBEHIND=$(( $(git rev-list --count ${ALB}..${ARB} 2>/dev/null) +0));
            NAHEAD=$(( $(git rev-list --count ${ARB}..${ALB} 2>/dev/null) +0));

            if [ "${NBEHIND}" -gt 0 ]; then

                if [ "${NAHEAD}" -gt 0 ]; then

                    echo " branch ${LB} is ${NBEHIND} commit(s) behind and ${NAHEAD} commit(s) ahead of ${REMOTE}/${RB}. could not be fast-forwarded";
                elif [ "${LB}" = "$CLB" ]; then
                    echo " branch ${LB} was ${NBEHIND} commit(s) behind of ${REMOTE}/${RB}. fast-forward merge";
                    git merge -q ${ARB};
                else
                    echo " branch ${LB} was ${NBEHIND} commit(s) behind of ${REMOTE}/${RB}. resetting local branch to remote";
                    git branch -f ${LB} -t ${ARB} >/dev/null;
                fi
            fi

        done
    done

}
