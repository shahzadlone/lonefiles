" Shahzad's Vim's Tmux Configurations and Mappings.

if exists('${TMUX}') " Mappings to only work if we are inside/using Tmux.

    " Function that helps switching between vim and tmux panes seemless.
    function! s:TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute 'wincmd ' . a:wincmd
        if previous_winnr == winnr()
            call system('tmux select-pane -' . a:tmuxdir)
            redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"),
                                            \'\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" .  &t_ti
    let &t_te = "\<Esc>]2;" .  previous_title . "\<Esc>\\" . &t_te

    " Switch between buffers(vim) and panes(tmux) using just CTRL with hjkl.
    nnoremap <silent> <C-h> :call <SID>TmuxOrSplitSwitch('h', 'L')<CR>
    nnoremap <silent> <C-j> :call <SID>TmuxOrSplitSwitch('j', 'D')<CR>
    nnoremap <silent> <C-k> :call <SID>TmuxOrSplitSwitch('k', 'U')<CR>
    nnoremap <silent> <C-l> :call <SID>TmuxOrSplitSwitch('l', 'R')<CR>

    " -----[ Vimex specific mappings. ]-----
    " Run the last command executed by VimuxRunCommand.
    nnoremap M :w<CR>:VimuxRunLastCommand<CR>

    " Prompt for a command to run in the other tmux pane.
    nnoremap <Leader>cmd :wa<CR>:VimuxPromptCommand<CR>

    " Run the make command in the other tmux pane (hit the final enter).
    nnoremap <Leader>M :wa<CR>:VimuxPromptCommand("make; echo ${?}")<CR><CR>

    " Send an Interrupt Signal (Ctrl-c) to the terminal (other tmux pane).
    nnoremap <Leader>C :w<CR>:VimuxInterruptRunner<CR>

    " Run the make command in the other tmux pane, and then run the executable without
    "  any arguments. Also show output of the return code. Look at ~/.bash/bash_functions
    "  for what my BINAME function does (just looks in Makefile for the executable name).
    nnoremap <Leader>R :wa<CR>:VimuxPromptCommand("
                        \make; echo \"make[ ${?} ]\";
                        \ ./$(BINAME);
                        \ echo \"$(BINAME)[ ${?} ]\"
                        \")<CR><CR>

    " Run the make command in the other tmux pane, and then run the executable without any
    "  arguments (but don't hit the final enter, so we can provide arguments if needed). 
    "  Also show output of the return code. Look at ~/.bash/bash_functions for what
    "  my BINAME function does (just looks in Makefile for the executable name).
    nnoremap <Leader>RR :wa<CR>:VimuxPromptCommand("
                         \make; echo \"make[ ${?} ]\";
                         \ ./$(BINAME);
                         \ echo \"$(BINAME)[ ${?} ]\"
                         \")<CR>

    " Runs the binary with valgrind without any arguments and shows output of the
    "  return code. Look at ~/.bash/bash_functions for BINAME function's use.
    nnoremap <Leader>V :wa<CR>:VimuxPromptCommand("
                        \make; echo \"make[ ${?} ]\";
                        \ valgrind
                        \ --leak-check=full --track-origins=yes --show-leak-kinds=all
                        \ ./$(BINAME);
                        \ echo \"$(BINAME)[ ${?} ]\"
                        \")<CR><CR>

    " Run the binary with valgrind (but doesn't hit the final enter). Also show output
    "  of the return code. Look at ~/.bash/bash_functions for BINAME function's use.
    nnoremap <Leader>VV :wa<CR>:VimuxPromptCommand("
                         \make; echo \"make[ ${?} ]\";
                         \ valgrind
                         \ --leak-check=full --track-origins=yes --show-leak-kinds=all
                         \ ./$(BINAME);
                         \ echo \"$(BINAME)[ ${?} ]\"
                         \")<CR>

    " Upload to the arduino chip using wio run (github.com/wio/wio for more).
    nnoremap <Leader>W :wa<CR>:VimuxPromptCommand("
                        \wio run --clean --upload --port /dev/ttyUSB0 --target <T>
                        \")<CR>

    " Open the coressponding PDF file using another terminal (Handy for LaTex files).
    autocmd FileType tex nnoremap <buffer> <Leader>O :wa<CR>:NeoTex<CR>:NeoTexOn<CR>
                                                     \:call VimuxRunCommand(
                                                     \ "zathura " . expand("%:r") . ".pdf"
                                                     \)<CR>

    " Open the coressponding PDF file for org files.
    autocmd FileType org nnoremap <buffer> <Leader>O :wa<CR>:OrgExportToPDF<CR>
                                                     \:call VimuxRunCommand(
                                                     \ "okular " . expand("%:r") . ".pdf"
                                                     \)<CR>

    " TODO:"
    " Send a Control-C (interrupt) and then run the last command executed by VimuxRunCommand.
    " nnoremap <Leader><C-m> :w<CR>:VimuxSendKeys(C-c)<CR>:VimuxRunLastCommand<CR>

endif " End of the Tmux check mappings (Refer to mappings.vim for default mappings).
