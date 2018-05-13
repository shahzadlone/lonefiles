" Shahzad's NeoVim Specific Configurations (Guards for if nvim or vim).

if has('nvim') " =======[ Configurations that are only applied when using neovim. ]======

    " In terminal mode (terminal buffer), make escape put me in normal mode.
    tnoremap <Esc> <C-\><C-n>

    " In terminal mode (terminal buffer), enter the actual escape (have to be in insert).
    tnoremap <C-Esc> <Esc>

    " Make moving out of the terminal buffer similar to my tmux and buffer movement keys.
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " To avoid neovim nesting and starting a new nvim process if used inside :terminal.
    let $VISUAL = 'nvr -cc split --remote-wait'

    " If we are using NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

    endif

elseif !has('nvim') " Configurations that are only applied when not using neovim (nvim).

    colorscheme evening

endif
