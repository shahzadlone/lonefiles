# Shahzad's Bash Functions.

cdm() {
    mkdir -p -- "${1}" && cd -P -- "${1}"
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

F() {
    old="${IFS}";
    IFS=' ';
    allArgs=$*;
    IFS="${old}";

    # Selected files and folders
    selected="$(fzf -m)"
    echo "${selected}" | xargs ${allArgs};
}

fnpm () {
    npm run $(jq -r '.scripts | keys[]' package.json | fzf --height=10)
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

micTest() {
    arecord -vvv -f dat /dev/null;
}

gpuTest() {
    glxgears;
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


