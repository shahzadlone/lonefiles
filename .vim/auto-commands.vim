" Shahzad's Automatic Vim Commands

" The fix for setting formatoptions-=cro all the time, to disable auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Detect any hidden file whose name starts with bash_ or bash- as a bash file.
au BufWinEnter,BufRead,BufNewFile .bash[_-]* set filetype=sh
