" Shahzad's NeoVim Specific Configurations (Guards for if nvim or vim).

" Configurations that are only applied when using neovim.
if has('nvim')

    " Begin nvim configurations.

    " To avoid neovim nesting and starting a new nvim process if used inside :terminal.
    let $VISUAL = 'nvr -cc split --remote-wait'

    " If we are using the NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

    endif

" Configurations that are only applied when using vim.
elseif !has('nvim')

    " Begin non-nvim configurations.
    colorscheme evening

endif
