" Shahzad's NeoVim Specific Configurations (Guards for if nvim or vim).

" Configurations that are only applied when using neovim.
if has('nvim')

    " Begin nvim configurations.

endif

" Configurations that are only applied when using vim.
if !has('nvim')

    " Begin non-nvim configurations.
    colorscheme evening

endif
