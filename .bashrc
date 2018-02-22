# Shahzad's Bash Aliases (Note: #!/bin/bash is not needed because not a script!)

# ~/.bashrc: executed by bash(1) for non-login shells.

# Source the file that contains my system's default settings (if it exists).
if [ -f ~/.bash/.bash_system_default ]; then
    . ~/.bash/.bash_system_default;
fi

# Source the file that contains my bash settings.
if [ -f ~/.bash/.bash_settings ]; then
    . ~/.bash/.bash_settings;
fi

# Source the file containing alias definitions, if it exists.
if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases;
fi

