" Shahzad's Automatic Vim Commands

" The fix for setting formatoptions-=cro all the time, to disable auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Detect any hidden file whose name starts with bash_ or bash- as a bash file.
autocmd BufWinEnter,BufRead,BufNewFile .bash[_-]* set filetype=sh

" Automatically resize windows(to equal sizes) when the terminal size is changed.
autocmd VimResized * wincmd =

" Open new buffers/files in a new tab (stops piling or opening things on top of one pane).
autocmd BufAdd,BufNewFile * nested tab sball

" When entering insert mode, turn relative line numbers off (show absolute line numbers).
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
