# Shahzad's Bash Functions.

# I can now do `Mark IWASTHERE` and just `cd ${IWASTHERE}` to go to that marked dir.
Mark() {
    export ${1}=`pwd`;
}
