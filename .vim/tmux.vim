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
    " Run the last command executed by VimuxRunCommand
    nnoremap M :w<CR>:VimuxRunLastCommand<CR>

    " Prompt for a command to run in the other tmux pane.
    nnoremap <Leader>cmd :wa<CR>:VimuxPromptCommand<CR>

    " Run the make command in the other tmux pane (hit the final enter).
    nnoremap <Leader>M :wa<CR>:VimuxPromptCommand("make; echo ${?}")<CR><CR>

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

endif " End of the Tmux check mappings (Refer to mappings.vim for default mappings).
