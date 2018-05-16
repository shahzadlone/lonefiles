" Shahzad's Automatic Vim Commands

" The fix for setting formatoptions-=cro all the time, to disable auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically resize windows(to equal sizes) when the terminal size is changed.
autocmd VimResized * wincmd =

" When editing a file, always jump to the last known cursor position, if a valid
"  position is known. Don't do if inside a commit messages or an event handler.
autocmd BufReadPost * if &ft != 'gitcommit' &&
                         \line("'\"") > 0 &&
                         \line("'\"") <= line("$") | exe "normal g`\"" | endif

" When entering insert mode, turn relative line numbers off (show absolute line numbers).
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Detect/overide any hidden file whose name starts with bash_ or bash- as a bash file.
autocmd BufWinEnter,BufRead,BufNewFile .bash[_-]* set filetype=sh

" Set the following filetypes only if the filetype was not detected (not set filetype=x).
autocmd BufWinEnter,BufRead,BufNewFile *.ru setfiletype ruby
autocmd BufWinEnter,BufRead,BufNewFile *.css.erb,*.spriter setfiletype css
autocmd BufWinEnter,BufRead,BufNewFile *.mkd,*.md,*.markdown setfiletype markdown
autocmd BufWinEnter,BufRead,BufNewFile *.json setfiletype javascript
autocmd BufWinEnter,BufRead,BufNewFile *.ejs,*.hbs setfiletype html
autocmd BufWinEnter,BufRead,BufNewFile *.go setfiletype go

" Indent my json file according to my preference.
autocmd FileType json nnoremap <buffer> <F5> :%!python -m json.tool<CR>

" Automatically update the working directory to the current file's path.
autocmd BufEnter * silent! cd %:p:h

" Open new buffers/files in a new tab (stops piling or opening things on top of one pane).
" autocmd BufAdd,BufNewFile * nested tab sball
