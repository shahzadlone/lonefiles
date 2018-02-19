# Shahzad's Bash Aliases (Note: #!/bin/bash is not needed because not a script!)

# -----[ For safety. ]----- {{{
# Show a prompt to double check before copying, moving or deleting something.
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# ------------------------- }}}

# -----[ For convinience. ]----- {{{
# For easier/faster listing to my liking.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# To easily source bashrc.
alias sobash='source ~/.bashrc'
# ----------------------------- }}}

# -----[ Enable color support for various commands. ]----- {{{
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# --------------------------------------------------------- }}}

# -----[ Extras. ]----- {{{
# Add an "alert" alias for long running commands. So can be notified after they finish.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)"\
             "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# To make working with the bare git repository easier (contains my dotfiles).
# Note: I call my dotfiles, lonefiles. Don't ask why I thought it was a good idea! :-)
alias lit='/usr/bin/git --git-dir="${HOME}"/.lonefiles/ --work-tree="${HOME}"'

# Works like an alias for opening pdfs, uses okular and disconnects from terminal.
#pdf() { "okular "${1}" 2> /dev/null &"; }
# -------------------- }}}
