" Shahzad's Automatic Vim Commands

" The fix for setting formatoptions-=cro all the time, to disable auto comments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically resize windows(to equal sizes) when the terminal size is changed.
autocmd VimResized * wincmd =

" Automatically update the working directory to the current file's path.
autocmd BufEnter * silent! lcd %:p:h

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

" Set the following filetypes only if the filetype was not detected (not set filetype=x).
augroup setFileTypes

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
  autocmd BufWinEnter,BufRead,BufNewFile go.mod set filetype=go

  " Detect/overide any hidden file whose name starts with bash_ or bash- as a bash file.
  autocmd BufWinEnter,BufRead,BufNewFile .bash[_-]* set filetype=sh

augroup END

" Enable the following whitespace symbols for all files by default.
autocmd FileType * setlocal listchars=tab:┃━,trail:·,eol:☆,nbsp:¬,extends:»,precedes:«

" Update the default whitespace and tab settings for go files.
autocmd FileType go setlocal listchars=tab:\ \ ⋮,trail:·,eol:☆,nbsp:¬,extends:»,precedes:«
autocmd FileType go setlocal ts=4 sts=4 sw=4

" Update the tab settings for other files.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType graphql setlocal ts=4 sts=4 sw=4

autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
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

"" WSL yank support
"let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
"if executable(s:clip)
"        augroup WSLYank
"                    autocmd!
"                    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"                        augroup END
"                    endif"

" autocmd BufWinEnter,BufRead,BufNewFile prettierrc set filetype=yaml

"" Indent and fix my files using eslint if they use it.
"autocmd FileType javascript,typescript,javascriptreact,typescriptreact,json,yaml
"                    \nnoremap <buffer> <F1> :CocCommand eslint.executeAutofix<CR>

" Open new buffers/files in a new tab (stops piling or opening things on top of one pane).
" autocmd BufAdd,BufNewFile * nested tab sball
