# Shahzad's default .profile that sources my shell configurations and adds my
#  environment variables (it doesn't matter which shell I am using).
# Note: if ~/.bash_profile or ~/.bash_login exists then this file is not read!

# If we are using bash then source my .bashrc configurations.
if [ -n "${BASH_VERSION}" ]; then
    # Only include my .bashrc if it exists.
    if [ -f "${HOME}/.bashrc" ]; then
        . "${HOME}/.bashrc"
    fi
fi

# Include my environment variables if ~/.environment_variables file exists.
if [ -f "${HOME}/.environment_variables" ]; then
    . "${HOME}/.environment_variables"
fi
