# Shahzad's .bashrc (Note: #!/bin/bash is not needed because not a script!)

# ~/.bashrc: executed by bash(1) for non-login shells.

# Start with Tmux by default. If not running interactively, do not do anything.
[[ $- != *i* ]] && return
[[ -z "${TMUX}" ]] && exec tmux


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

# Source the file containing alias definitions, if it exists.
if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases;
fi

# Source the file containing all the exports, if there.
if [ -f ~/.bash/.bash_exports ]; then
    . ~/.bash/.bash_exports;
fi

# Source the file containing all the functions, if there.
if [ -f ~/.bash/.bash_functions ]; then
    . ~/.bash/.bash_functions;
fi
