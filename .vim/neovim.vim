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

    " Open the terminal in a new tab (hopefully in the tab to the right).
    nnoremap <Leader>ter :tab new \| :terminal<CR>

    " Open the terminal in a horizontal spilt (below), just like my tmux key bindings.
    nnoremap <Leader>- :split \| :terminal<CR>

    " Open the terminal in a vertical spilt (right), just like my tmux key bindings.
    nnoremap <Leader>\| :vsplit \| :terminal<CR>

    " Terminal configurations.
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=blue guifg=white ctermbg=1 ctermfg=15

    " Disable syntax highlighting of errors, within a json file.
    let g:vim_json_warnings = 0

    " To avoid neovim nesting and starting a new nvim process if used inside :terminal.
    " let $VISUAL = 'nvr -cc split --remote-wait'

    " Need this auto command to make git in seperate buffers work properly, because
     " the nvr commands using +'set buffhidden=delete' isn't working (commit and add).
    autocmd FileType gitcommit,diff set bufhidden=delete

    " If we are using NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

        " NyaoVim's Mini browser mapping.
        nnoremap <Leader>U :<C-u>MiniBrowser <C-r><C-p><CR>

        " Calls the javascript function that enables to toggle fullscreen on and off.
        nnoremap <F11> :call nyaovim#call_javascript_function('toggleFullScreen', [])<CR>

    endif

    let g:clipboard = {
                    \   'name': 'xclip',
                    \   'copy': {
                    \      '+': 'xclip -selection clipboard',
                    \      '*': 'xclip -selection clipboard',
                    \    },
                    \   'paste': {
                    \      '+': 'xclip -selection clipboard -o',
                    \      '*': 'xclip -selection clipboard -o',
                    \   },
                    \   'cache_enabled': 1,
                    \ }

    set guifont=FiraCode\ NF:h16

elseif !has('nvim') " Configurations that are only applied when not using neovim (nvim).

    " colorscheme evening

endif
