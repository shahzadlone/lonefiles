# Shahzad's Bash Aliases (Note: #!/bin/bash is not needed because not a script!)

# Helper function to find if a package / program exists or not.
Exists() { which "${1}" 2>&1 > /dev/null; echo ${?}; }

# -----[ Overwrite default programs/commands usage. ]----- {{{
# Make sudo work with aliases!
alias sudo='sudo '

# For saftly show a prompt to double check before overwriting by the copying command.
alias cp='cp -i'

# For saftly show a prompt to double check before overwriting by the moving command.
alias mv='mv -i'

# For saftly show a prompt to double check before deleting anything(unless -f is used).
alias rm='rm -i'

# Never use vi, like ever (see '~/.bash/bash_exports' for how $NORMAL_VIM is exported).
alias vi="\${NORMAL_VIM}";

# see '~/.bash/bash_exports' for how $VISUAL is exported (could be: vim, nvim, nvr).
alias vim="\${VISUAL}";

# see '~/.bash/bash_exports'. Also this helps shorten the vimdiff command.
alias vdiff="\${VISUAL} -d";

# If we have nyaovim on the system, then make these aliases for it.
if [ $(Exists "nyaovim") -eq 0 ]; then

    # Additional aliases to start nyaovim, if neovim and nyaovim are there.
    alias nvim='\nyaovim -p';
    alias nvdiff='\nyaovim -d';

fi

# By default enable colors if possible for ls, dir, vdir, grep, fgrep, egrep commands.
if [ -x /usr/bin/dircolors ]; then

    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

fi
# ------------------------- }}}

# -----[ For convinience. ]----- {{{
# For easier/faster listing to my liking.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# List all hidden files only, that aren't .. or . on seperate lines (append / to dirs).
alias lh='ls -Ap1 | egrep "^\..*$"'

# To easily source bashrc.
alias sobash='source ~/.bashrc'
# ----------------------------- }}}

# -----[ Extras. ]----- {{{
# Add an "alert" alias for long running commands. So can be notified after they finish.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)"\
             "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# To make working with the bare git repository easier (contains my dotfiles).
# Note: I call my dotfiles, lonefiles. Don't ask why I thought it was a good idea! :-)
alias lit='\git --git-dir="${HOME}"/.lonefiles/ --work-tree="${HOME}"'

# Quickly check the git status of the bare repo, which also shows unpushed commits.
alias lits='lit status && \
            printf "\nYour unpushed commits:\n" && \
            lit log --stat --oneline @{u}...HEAD'

# Short alias for committing the staged files (view them first in vim).
alias litc='lit commit -v'

# Short alias to quickly push my dotfiles (bare git repository).
alias litp='lit push'

# To quickly start staging modified dotfiles files, with the patch option (in hunks)
alias lita='lit add -p'

# To quickly show a diff of all the modified files.
alias litd='lit diff'

# To quickly show a diff of all the staged/cached files.
alias litds='lit diff --cached'

# To quickly show the commit log.
alias litl='lit log'

# To do a reset quickly.
alias litr='lit reset'

# Quickly check the git status, with a view if unpushed commits.
alias gits='\git status && \
            printf "\nYour unpushed commits:\n" && \
            git log --stat --oneline @{u}...HEAD'

# To host a server listing files in current directory at port 8080, and detach
alias HOST='python -m SimpleHTTPServer 8080 &'

# To open the local hosted server at port 8080, and detach the session.
alias OPEN='firefox --new-window "http://localhost:8080" &'

# Quickly HOST and OPEN that hosted server.
alias OPENHOST='HOST OPEN'
# -------------------- }}}

# -----[ Rough, needs some work. ]----- {{{
# To quickly execute the last command with all it's arguments.
# alias LAST='!:0-*'

# Quickly start my instagram script!
alias instagram='~/Desktop/instagram/oldBot/loneple.py'
alias utagram='~/Desktop/instagram/unfollowsync/follow-sync -wait 95'

# Works like an alias for opening pdfs, uses okular and disconnects from terminal.
#pdf() { "okular "${1}" 2> /dev/null &"; }
# -------------------- }}}
