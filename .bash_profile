echo "hello from bash"
eval $(/opt/homebrew/bin/brew shellenv)

# Shahzad's .bash_profile that sources my bash shell configurations and adds
#  my environment variables.
# Note: Because this file exists, then ~/.profile file won't be read.

if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc";
else
    echo "Warning: .bashrc didn't get sourced in '.bash_profile' file.";
fi

# Include my environment variables if ~/.environment_variables file exists.
if [ -f "${HOME}/.environment_variables" ]; then
    . "${HOME}/.environment_variables";
else
    echo "Warning: .environment_variables didn't get sourced in '.bash_profile' file.";
fi
