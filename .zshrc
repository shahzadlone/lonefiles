
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

## Find the exact distribution(DISTRO) we are on and also rough flavour type (DISTRO_TYPE).
## Examples:
## - "Manjaro Linux" == for Manjaro Arch Linux.
## - "Arch Linux"    == for Vanilla Arch Linux.
## - "Ubuntu"        == for Ubuntu Linux.
## - "Darwin"        == for Apple's MacOS.
#DISTRO=$(cat /etc/os-release | grep "^NAME" | cut -c 6- | cut -d "\"" -f 2);
#DISTRO_TYPE=${DISTRO};
#if [ "${DISTRO_TYPE}" == "Arch Linux" ] || [ "${DISTRO_TYPE}" == "Manjaro Linux" ]; then
#    DISTRO_TYPE="Arch";
#fi
## Source the fzf's bash configurations.
#if [ "${DISTRO}" == "Manjaro Linux" ] && [ -f ~/.fzf.bash ]; then
#    source /usr/share/fzf/key-bindings.zsh;
#    source /usr/share/fzf/completion.zsh;
#elif [ -f ~/.fzf.bash ]; then
#    . ~/.fzf.bash;
#else
#    echo "Warning: .fzf.bash didn't get sourced in '.bashrc' file for '${DISTRO}'.";
#fi
