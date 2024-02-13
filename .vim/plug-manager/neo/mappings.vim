" Shahzad's ONLY NeoVim(nvim) Specifc Plugin Mappings.

if has('nvim')

    " If we are using the NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

    endif

    nnoremap <leader>nt <cmd>CHADopen<cr>

endif
