# Shahzad's Bash Aliases (Note: #!/bin/bash is not needed because not a script!)

# Helper function to find if a package / program exists or not.
Exists() { which "${1}" &> /dev/null; echo ${?}; }

# -----[ Overwrite default programs/commands usage. ]----- {{{
# Make sudo work with aliases!
alias sudo='sudo ';

# Have a shortcut for sudo!
alias s='sudo ';

# For saftly show a prompt to double check before overwriting by the copying command.
alias cp='cp -i';

# For saftly show a prompt to double check before overwriting by the moving command.
alias mv='mv -i';

# For saftly show a prompt to double check before deleting anything(unless -f is used).
alias rm='rm -i';

# Never use vi, like ever (see '~/.bash/bash_exports' for how $NORMAL_VIM is exported).
alias vi="\${NORMAL_VIM}";

# see '~/.bash/bash_exports' for how $VISUAL is exported (could be: vim, nvim, nvr).
alias vim="\${VISUAL}";
alias v="\${VISUAL}";

# see '~/.bash/bash_exports'. Also this helps shorten the vimdiff command.
alias vdiff="\${VISUAL} -d";

# Open all git files that are changes / have conflicts in nvim (seaching for <<<<<<<).
alias vfix='vim +/\<\<\<\<\<\<\< `git diff --name-only | uniq`';

# If we have nyaovim on the system, then make these aliases for it.
if [ "$(Exists "nyaovim")" -eq 0 ]; then

    # Additional aliases to start nyaovim, if neovim and nyaovim are there.
    alias nvim='\nyaovim -p';
    alias nvdiff='\nyaovim -d';

fi

# By default enable colors if possible for ls, dir, vdir, grep, fgrep, egrep commands.
if [ -x /usr/bin/dircolors ]; then

    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto';
    alias dir='dir --color=auto';
    alias vdir='vdir --color=auto';
    alias grep='grep --color=auto';
    alias fgrep='fgrep --color=auto';
    alias egrep='egrep --color=auto';

fi
# ------------------------- }}}

# -----[ For convinience. ]----- {{{

# Map thefuck's fuck command to fix.
if [ "$(Exists 'thefuck')" -eq 0 ]; then
    eval "$(thefuck --alias fix)";
fi

# Map stat to tokei if it's installed.
if [ "$(Exists 'tokei')" -eq 0 ]; then
    alias stat='tokei';
fi

# Map ls to lsd if we have lsd installed.
if [ "$(Exists 'lsd')" -eq 0 ]; then
    alias ls='lsd'
fi

# Map cd to zoxide (z) if we have zoxide installed.
if [ "$(Exists 'zoxide')" -eq 0 ]; then
    eval "$(zoxide init bash)";

    alias cd='z';
    alias cdi='zi';
fi

# Fzf aliases if we have it installed.
if [ "$(Exists 'fzf')" -eq 0 ]; then
    # Fzf cd shortcut. I also tried to alias `__fzf_cd__` but that didn't work properly.
    alias cdd="cd ~ && cd \$(find * -type d | fzf)";

    # A short cut for fuzzy finder.
    alias f='fzf';

    # A short cut to open files with vim through fzf.
    alias vimm='vim $(fzf --height 40% --reverse)';
fi

# For easier/faster listing to my liking.
alias ll='ls -alF';
alias la='ls -AF';
alias l='ls -F';

# List all hidden files only, that aren't .. or . on seperate lines (append / to dirs).
alias lh='ls -dF .!(|.)';

# To easily untar(unzip) a tarball.
alias untar='tar -xvzf';

# A short cut to reset my terminal screen (can still scroll up).
alias r='reset';

# A short cut to clear my terminal screen (can't scroll up, gone for good).
alias cl='clear';

# Short cut for docker.
alias d='sudo docker';

# Help me see whitespaces. Example: `bash --help | whitespace`
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'";
# ----------------------------- }}}

# -----[ Git. ]----- {{{
# A short cut to use git.
alias g='git';

# Needed to turn autocompletion on with g as git's alias.
complete -o bashdefault -o default -o nospace -F __git g 2> /dev/null \
 || complete -o default -o nospace -F __git g

# To make working with the bare git repository easier (contains my dotfiles).
# Note: I call my dotfiles, lonefiles. Don't ask why I thought it was a good idea! :-)
alias lit='\git --git-dir="${HOME}"/.lonefiles/ --work-tree="${HOME}"';

# Quickly check the git status of the bare repo, which also shows unpushed commits.
alias lits='lit status && \
            printf "\nYour unpushed commits:\n" && \
            lit log --stat --oneline @{u}...HEAD';

# Short alias for committing the staged files (view them first in vim).
alias litc='lit commit -v';

# Short alias to quickly push my dotfiles (bare git repository).
alias litp='lit push';

# To quickly start staging modified dotfiles files, with the patch option (in hunks)
alias lita='lit add -p';

# To quickly add all updated / modified dotfiles that are being tracked.
alias litaa='lit add -u';

# To quickly show a diff of all the modified files.
alias litd='lit diff';

# To quickly show a diff of all the staged/cached files.
alias litds='lit diff --cached';

# To quickly show the commit log.
alias litl='lit log';

# To do a reset quickly.
alias litr='lit reset';

# Switch remote to ssh protocol.
alias litssh='lit remote set-url origin git@github.com:shahzadlone/lonefiles.git';

# Switch remote to http protocol.
alias lithttp='lit remote set-url origin https://github.com/shahzadlone/lonefiles.git';

# Quickly check the git status, with a view if unpushed commits.
alias gits='\git status && \
            printf "\nYour unpushed commits:\n" && \
            git log --stat --oneline @{u}...HEAD';

# Pull all remote git branches for this repository.
alias gitpla='GitPullAllBranches';

# ----------------------------- }}}

# -----[ Extras. ]----- {{{
# Open pavucontrol.
alias sound='pavucontrol';

# Add an "alert" alias for long running commands. So can be notified after they finish.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)"\
             "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"';

# To host a server listing files in current directory at port 8080, and detach
alias HOST='python -m SimpleHTTPServer 8080 &';

# To open the local hosted server at port 8080, and detach the session.
alias OPEN='firefox --new-window "http://localhost:8080" &';

# Quickly HOST and OPEN that hosted server.
alias OPENHOST='HOST OPEN';

# List installed fonts.
alias Fonts='fc-list';
# -------------------- }}}

# -----[ Pacman and Yay ]----- {{{
alias pacman='sudo pacman';
alias P='sudo pacman';
alias PT='pactree';
alias Pi='sudo pacman -S';
alias Pu='sudo pacman -Syu';
alias Y='yay';
alias Yi='yay -S';
alias Yu='yay -Syu';

# Remove a package and its deps that aren't needed by any other installed package.
alias Pr='sudo pacman -Rs';
# Remove a package, its deps and all the packages that depend on it.
alias PR='sudo pacman -Rsc';
# Remove a package, without removing it's dependent packages. (DANGER: use wisely).
alias Prd='sudo pacman -Rdd';
# Show pacman cache.
alias Pcache='du -sh /var/cache/pacman/pkg/';
# Clean pacman cache.
alias Pclean='sudo pacman -Sc';
# List all packages (pacman and non-AUR).
alias Plsa='sudo pacman -Qqe';
# List all pacman ONLY (non-AUR / non-foreign) packages.
alias Pls='sudo pacman -Qqen';
# List all non-AUR / non-foreign packages ONLY.
alias Plsy='sudo pacman -Qqm';

# Don't forget to: ```makepkg -si``` after editing PKGBUILD.
alias Yget='yay -G';
# Edit package before building.
alias Yedit='yay -S --editmenu';
# Remove a package and its deps that aren't needed by any other installed package.
alias Yr='yay -Rs';
# Remove a package, its deps and all the packages that depend on it.
alias YR='yay -Rsc';
# Remove a package, without removing it's dependent packages. (DANGER: use wisely).
alias Yrd='yay -Rdd';
# --------------------- }}}

# -----[ Rough, needs some work. ]----- {{{
# To quickly execute the last command with all it's arguments.
# alias LAST='!:0-*';

# Quickly start my instagram script!
alias instagram='python3 ~/Desktop/projects/instagram/oldBot/loneple.py';
alias utagram='~/Desktop/projects/instagram/unfollowsync/unfollowsync -wait 97';

# Works like an alias for opening pdfs, uses okular and disconnects from terminal.
#pdf() { "okular "${1}" 2> /dev/null &"; }
# -------------------- }}}
