# Shahzad's .bashrc (Note: #!/bin/bash is not needed because not a script!)

# ~/.bashrc: executed by bash(1) for non-login shells.

# Helper function to find if a package / program exists or not.
Exists() { which "${1}" &> /dev/null; echo ${?}; }

# Helper function to find if we are in tmux process or not.
procParent() {
    basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat \
                  | cut -d \  -f 4) | tail -1 | sed 's/^.* //');
}

# Find the exact distribution(DISTRO) we are on and also rough flavour type (DISTRO_TYPE).
# Examples:
# - "Manjaro Linux" == for Manjaro Arch Linux.
# - "Arch Linux"    == for Vanilla Arch Linux.
# - "Ubuntu"        == for Ubuntu Linux.
# - "Darwin"        == for Apple's MacOS.
DISTRO=$(cat /etc/os-release | grep "^NAME" | cut -c 6- | cut -d "\"" -f 2);
DISTRO_TYPE=${DISTRO};
if [ "${DISTRO_TYPE}" == "Arch Linux" ] || [ "${DISTRO_TYPE}" == "Manjaro Linux" ]; then
    DISTRO_TYPE="Arch";
fi

# Start with Tmux by default. If not running interactively, do not do anything.
[[ $- != *i* ]] && return
[[ -z "${TMUX}" ]] && [[ $(Exists "tmux") -eq 0 ]] && exec tmux -u

# Source the file that contains my system's default settings (if it exists).
if [ -f ~/.bash/.bash_system_default ]; then
    . ~/.bash/.bash_system_default;
else
    echo "Warning: .bash_system_default didn't get sourced in '.bashrc' file.";
fi

# Source the file that contains my terminal prompt configurations.
if [ -f ~/.bash/.bash_prompt ]; then
    . ~/.bash/.bash_prompt;
else
    echo "Warning: .bash_prompt didn't get sourced in '.bashrc' file.";
fi

# Source the file that contains my bash settings.
if [ -f ~/.bash/.bash_settings ]; then
    . ~/.bash/.bash_settings;
else
    echo "Warning: .bash_settings didn't get sourced in '.bashrc' file.";
fi

# Source the file containing all the functions, if there.
if [ -f ~/.bash/.bash_functions ]; then
    . ~/.bash/.bash_functions;
else
    echo "Warning: .bash_functions didn't get sourced in '.bashrc' file.";
fi

# Source the file containing all the exports, if there.
if [ -f ~/.bash/.bash_exports ]; then
    . ~/.bash/.bash_exports;
else
    echo "Warning: .bash_exports didn't get sourced in '.bashrc' file.";
fi

# Source the file containing alias definitions, if it exists.
if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases;
else
    echo "Warning: .bash_aliases didn't get sourced in '.bashrc' file.";
fi

# Source the file containing bash completions, if it exists.
if [ -f ~/.bash/.bash_completions ]; then
    . ~/.bash/.bash_completions;
else
    echo "Warning: .bash_completions didn't get sourced in '.bashrc' file.";
fi

# Source the fzf's bash configurations.
if [ "${DISTRO}" == "Manjaro Linux" ] && [ -d /usr/share/fzf ]; then
    . /usr/share/fzf/key-bindings.bash;
    . /usr/share/fzf/completion.bash;
elif [ -f ~/.fzf.bash ]; then
    . ~/.fzf.bash;
else
    echo "Warning: .fzf.bash didn't get sourced in '.bashrc' file for '${DISTRO}'.";
fi

if [ $(procParent) == "kitty" ] && [ -n "$TMUX" ]; then
    neofetch --kitty --source ~/Desktop/shahzad.jpg;
else
    neofetch;
fi

# ===================================================================================
# Anything added after this should be taken care off (as it was automatically added):
# ===================================================================================
