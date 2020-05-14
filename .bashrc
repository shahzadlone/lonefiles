# Shahzad's .bashrc (Note: #!/bin/bash is not needed because not a script!)

# ~/.bashrc: executed by bash(1) for non-login shells.

# Helper function to find if a package / program exists or not.
Exists() { which "${1}" &> /dev/null; echo ${?}; }

# Helper function to find if we are in tmux process or not.
procParent() {
    basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat \
                  | cut -d \  -f 4) | tail -1 | sed 's/^.* //');
} 

# Start with Tmux by default. If not running interactively, do not do anything.
[[ $- != *i* ]] && return
[[ -z "${TMUX}" ]] && [[ $(Exists "tmux") -eq 0 ]] && exec tmux

# Source the file that contains my system's default settings (if it exists).
if [ -f ~/.bash/.bash_system_default ]; then
    . ~/.bash/.bash_system_default;
fi

# Source the file that contains my terminal prompt configurations.
if [ -f ~/.bash/.bash_prompt ]; then
    . ~/.bash/.bash_prompt;
fi

# Source the file that contains my bash settings.
if [ -f ~/.bash/.bash_settings ]; then
    . ~/.bash/.bash_settings;
fi

# Source the file containing all the functions, if there.
if [ -f ~/.bash/.bash_functions ]; then
    . ~/.bash/.bash_functions;
fi

# Source the file containing all the exports, if there.
if [ -f ~/.bash/.bash_exports ]; then
    . ~/.bash/.bash_exports;
fi

# Source the file containing alias definitions, if it exists.
if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases;
fi

# Source the fzf's bash configurations.
if [ -f ~/.fzf.bash ]; then
    . ~/.fzf.bash;
fi

if [ $(procParent) == "kitty" ] && [ -n "$TMUX" ]; then
    neofetch --kitty --source ~/Desktop/shahzad.jpg;
else
    neofetch;
fi
