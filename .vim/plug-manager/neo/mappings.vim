" Shahzad's ONLY NeoVim(nvim) Specifc Plugin Mappings.

if has('nvim')

    " If we are using the NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

    endif

    "===================================================================================== ChadTree
    nnoremap <leader>nt <cmd>CHADopen<CR>

    "==================================================================================== Telescope
    nnoremap <Leader>ff <cmd>Telescope find_files<CR>
    nnoremap <Leader>fr <cmd>Telescope live_grep<CR>
    nnoremap <Leader>fb <cmd>Telescope buffers<CR>
    nnoremap <Leader>fh <cmd>Telescope oldfiles<CR>
    nnoremap <Leader>fs <cmd>Telescope grep_string<CR>
    cnoremap <C-p> <cmd>Telescope command_history<CR>

endif
