" Shahzad's Vim Plugins that are common for BOTH Vims' (compatible with NeoVim and Vim).

" Helps rename the current file by just :Rename <new-filename>.
Plug 'vim-scripts/Rename'

" Helps merge tabs, into splits.
Plug 'vim-scripts/Tabmerge'

" Adds the vim surrounding feature, to surround things using s.
Plug 'tpope/vim-surround'

" Seemless git interaction inside vim.
" Plug 'tpope/vim-fugitive'

" Enables repeating the surround command with the dot(.).
Plug 'tpope/vim-repeat'

" Nerd Tree for easier files, directory navigation.
Plug 'scrooloose/nerdtree'

" For easier commenting using <Leader> and 'c' command with combinations.
Plug 'scrooloose/nerdcommenter'

" To get rainbow nested parenthesis.
Plug 'luochen1990/rainbow'

" To help make the interaction with tmux seemless.
Plug 'benmills/vimux'

" To get the Table Mode.
Plug 'dhruvasagar/vim-table-mode'

" Advance C++ syntax and type highlighting.
Plug 'octol/vim-cpp-enhanced-highlight'

" Git gutter to show modified lines in file.
Plug 'airblade/vim-gitgutter'

" Status bar.
Plug 'vim-airline/vim-airline'

" Status bar themes.
Plug 'vim-airline/vim-airline-themes'

" Super tab to make compatible YCM and UltiSnip with tab.
Plug 'ervandew/supertab'

" Auto completing suggestions.
Plug 'Valloric/YouCompleteMe'

" Auto matching html tags.
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'xhtml', 'xml', 'jinja' ] }

" To get quick snippets.
Plug 'SirVer/ultisnips', { 'for': ['c', 'cpp'] }
Plug 'honza/vim-snippets', { 'for': ['c', 'cpp'] }

" Quick latex completion.
Plug 'brennier/quicktex'

" Quick latex compilation.
Plug 'lervag/vimtex'

" Easily switch between the header and source files.
Plug 'derekwyatt/vim-fswitch'

" Org mode for vim.
Plug 'jceb/vim-orgmode'

" Easy motion.
Plug 'easymotion/vim-easymotion'

" Integrate GDB.
" Plug 'vim-scripts/Conque-GDB'

" Install the gruvbox theme.
Plug 'morhetz/gruvbox'
