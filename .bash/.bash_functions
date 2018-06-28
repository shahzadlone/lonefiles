# Shahzad's Bash Functions.

# I can now do `Mark IWASTHERE` and just `cd ${IWASTHERE}` to go to that marked dir.
Mark() {
    export ${1}=`pwd`;
}

# If the directory has a Makefile with `EXEC = bin`, this function returns bin. Helpful
#  when in my vim's vimux mapping I just want to run "make && ./`BINAME`" to quickly 
#  make the binary using the makefile and then run the created executable(bin).
BINAME() {
    cat Makefile | \grep 'EXEC = ' | tr -s ' ' | cut -d' ' -f3;
}

CloneAll() {
    # Make the url of the input github organization's repository page (200 max).
    ORG_URL="https://api.github.com/orgs/${1}/repos?per_page=200";

    # List of all repositories of that organization (seperated by newline-eol).
    ALL_REPOS=$(curl -s ${ORG_URL} | grep html_url | awk 'NR%2 == 0' \
                | cut -d ':' -f 2-3 | tr -d '",');

    # Clone all the repositories.
    for ORG_REPO in ${ALL_REPOS}; do
        git clone ${ORG_REPO}.git;
    done
}

cdm() {
    mkdir -p -- "${1}" && cd -P -- "${1}"
}

