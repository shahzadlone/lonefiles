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
