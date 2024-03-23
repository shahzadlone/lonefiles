" Shahzad's Vim Plugins that ONLY work for normal vim (might break neovim) or
"  plugins that we ONLY want to use if we are using normal vim (else keep them disabled).

if !has('nvim')

" Conquer of Completion for fast LSP language completion.
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

" Nerd Tree for easier files, directory navigation.
Plug 'preservim/nerdtree'
" Nerd Tree git support,
Plug 'Xuyuanp/nerdtree-git-plugin'
" For nerd tree highlighting (needs devicons).
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

endif
