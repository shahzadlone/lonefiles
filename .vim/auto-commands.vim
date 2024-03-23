" Shahzad's Automatic Vim Commands

" The fix for setting formatoptions-=cro all the time, to disable auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically resize windows(to equal sizes) when the terminal size is changed.
autocmd VimResized * wincmd =

" When I close current tab, go to the last recent tab I was in before this one.
autocmd TabClosed * execute "wincmd g\<Tab>"

" When editing a file, always jump to the last known cursor position, if a valid
"  position is known. Don't do if inside a commit messages or an event handler.
autocmd BufReadPost * if &ft != 'gitcommit' &&
                         \line("'\"") > 0 &&
                         \line("'\"") <= line("$") | exe "normal g`\"" | endif

" Remove the cursor's line and column highlighting when we leave or are in insert.
" Inspired by the `conoline.vim plugin`:
"   https://github.com/miyakogi/conoline.vim/blob/master/autoload/conoline.vim
" Also when in insert mode, turn relative line numbers off (show absolute line numbers).
augroup ToggleFocusEvents
  autocmd!
  autocmd WinEnter,BufEnter,FocusGained,InsertLeave * set cursorline cursorcolumn relativenumber
  autocmd WinLeave,BufLeave,FocusLost,InsertEnter * set nocursorline nocursorcolumn norelativenumber
augroup END

" Keep my cursor on the middle of the screen, so equal number of lines are above and below.
" Inspired by:
"   https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
augroup CenterCursor
  autocmd!
  autocmd WinEnter,BufEnter,WinNew,VimResized *,*.* let &scrolloff=winheight(win_getid())/2
augroup END

" Set the following filetypes only if the filetype was not detected (not set filetype=x).
augroup SetFileTypes
  autocmd BufWinEnter,BufRead,BufNewFile *.ru set filetype=ruby
  autocmd BufWinEnter,BufRead,BufNewFile *.css.erb,*.spriter set filetype=css
  autocmd BufWinEnter,BufRead,BufNewFile *.mkd,*.md,*.markdown set filetype=markdown
  autocmd BufWinEnter,BufRead,BufNewFile *.js set filetype=javascript
  autocmd BufWinEnter,BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufWinEnter,BufRead,BufNewFile *.ts set filetype=typescript
  autocmd BufWinEnter,BufRead,BufNewFile *.tsx set filetype=typescriptreact
  autocmd BufWinEnter,BufRead,BufNewFile *.ejs,*.hbs set filetype=html
  autocmd BufWinEnter,BufRead,BufNewFile *.json set filetype=json
  autocmd BufWinEnter,BufRead,BufNewFile *.prisma set filetype=graphql
  " Detect/overide any hidden file whose name starts with bash_ or bash- as a bash file.
  autocmd BufWinEnter,BufRead,BufNewFile .bash[_-]* set filetype=sh
augroup END

" Set Space and Tab Settings.
augroup SpaceAndTabs
  autocmd FileType go setlocal ts=4 sts=4 sw=4
  autocmd FileType graphql setlocal ts=4 sts=4 sw=4
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Enable the following whitespace symbols for all files by default.
autocmd FileType * setlocal listchars=tab:┃━,trail:·,eol:☆,nbsp:¬,extends:»,precedes:«

" Update the default whitespace and tab settings for go files.
autocmd FileType go setlocal listchars=tab:\ \ ⋮,trail:·,eol:☆,nbsp:¬,extends:»,precedes:«

" Fix json comment highlighting..
autocmd FileType json syntax match Comment +\/\/.\+$+

" Indent visually selected JSON according to my preference.
autocmd FileType json vnoremap <buffer> <F5> :!python -m json.tool<CR>

" Trigger `autoread` when changing buffers or if cursor was not moved. This is to
"  reload a changed buffer automatically, to avoid locking us from writing to the file.
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Still want to see the notification after file change, so we can be aware.
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Automatically update the working directory to the current file's path.
" autocmd BufEnter * silent! lcd %:p:h

"" WSL yank support
"let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
"if executable(s:clip)
"        augroup WSLYank
"                    autocmd!
"                    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"                        augroup END
"                    endif"

" autocmd BufWinEnter,BufRead,BufNewFile prettierrc set filetype=yaml

" Open new buffers/files in a new tab (stops piling or opening things on top of one pane).
" autocmd BufAdd,BufNewFile * nested tab sball

" ====================================[ File specific mappings ]==================================== 

augroup GoLangMappings
  " Set quick mappings for making debug statements.
  autocmd FileType go nnoremap <buffer> <Leader>l! msOfmt.Println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l@ msOfmt.Println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l# msOfmt.Println("####################################")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l$ msOfmt.Println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l% msOfmt.Println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l^ msOfmt.Println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l& msOfmt.Println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l* msOfmt.Println("************************************")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l- msOfmt.Println("------------------------------------")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l= msOfmt.Println("====================================")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l+ msOfmt.Println("++++++++++++++++++++++++++++++++++++")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l0 msOfmt.Println("000000000000000000000000000000000000")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l1 msOfmt.Println("111111111111111111111111111111111111")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l2 msOfmt.Println("222222222222222222222222222222222222")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l3 msOfmt.Println("333333333333333333333333333333333333")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l4 msOfmt.Println("444444444444444444444444444444444444")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l5 msOfmt.Println("555555555555555555555555555555555555")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l6 msOfmt.Println("666666666666666666666666666666666666")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l7 msOfmt.Println("777777777777777777777777777777777777")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l8 msOfmt.Println("888888888888888888888888888888888888")mp.`sdd`pP
  autocmd FileType go nnoremap <buffer> <Leader>l9 msOfmt.Println("999999999999999999999999999999999999")mp.`sdd`pP
augroup END
