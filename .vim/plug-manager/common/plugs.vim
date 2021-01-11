" Shahzad's Vim Plugins that are common for BOTH Vims' (compatible with NeoVim and Vim).

" Helps rename the current file by just :Rename <new-filename>.
Plug 'vim-scripts/Rename'

" Helps merge tabs, into splits.
Plug 'vim-scripts/Tabmerge'

" Universal text linking support.
Plug 'vim-scripts/utl.vim'

" Adds the vim surrounding feature, to surround things using s.
Plug 'tpope/vim-surround'

" Enables repeating the surround command with the dot(.).
Plug 'tpope/vim-repeat'

" Git interaction inside vim.
Plug 'tpope/vim-fugitive'

" Enables continuously updated session files containing the current vim state.
Plug 'tpope/vim-obsession'

" Fast incrementing and decrementing of date and time formats.
Plug 'tpope/vim-speeddating'

" Nerd Tree for easier files, directory navigation.
Plug 'scrooloose/nerdtree'

" Nerd Tree git support,
Plug 'Xuyuanp/nerdtree-git-plugin'

" For easier commenting using <Leader> and 'c' command with combinations.
Plug 'scrooloose/nerdcommenter'

" For using icons and nerd fonts.
Plug 'ryanoasis/vim-devicons'

" To get rainbow nested parenthesis.
Plug 'luochen1990/rainbow'

" To help make the interaction with tmux seemless.
Plug 'benmills/vimux'

" To get the Table Mode.
Plug 'dhruvasagar/vim-table-mode'

" Git gutter to show modified lines in file.
Plug 'airblade/vim-gitgutter'

" Status bar.
Plug 'vim-airline/vim-airline'

" Status bar themes.
Plug 'vim-airline/vim-airline-themes'

" Calendar support.
Plug 'mattn/calendar-vim'

" Support for multiple syntax types in one file.
Plug 'inkarkat/vim-SyntaxRange'

" Emac's narrowing feature.
Plug 'chrisbra/NrrwRgn'

" Super tab to make compatible YCM and UltiSnip with tab.
Plug 'ervandew/supertab'

" Auto matching html tags.
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'xhtml', 'xml', 'jinja' ] }

" Side panel to show all the tags within scope.
Plug 'preservim/tagbar'

" TagList for source code browsing.
Plug 'yegappan/taglist'

" Better colour higlighting for Vue.js syntax.
Plug 'posva/vim-vue'

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

" Fuzzy Finder, keep latest binary and the plugin.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Easy motion.
Plug 'easymotion/vim-easymotion'

" Bazel build.
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" C/C++/ObjC semantic highlighting using the language server protocol (LSP). 
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Conquer of Completion for fast LSP language completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Install the gruvbox theme.
Plug 'morhetz/gruvbox'

" Help align text that matches a pattern.
Plug 'godlygeek/tabular'

" Syntax highlighting, matching rules and mappings for markdown and extensions.
Plug 'plasticboy/vim-markdown'

" Vimwiki note taking.
" Plug 'vimwiki/vimwiki'

" Easy tag management for Vim (vim-misc is a needed dependency).
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

" Advance C++ syntax and type highlighting.
" Plug 'octol/vim-cpp-enhanced-highlight', {'for':['c', 'cpp']}

" Hacker typer mode for vim.
" Plug 'mjbrownie/hackertyper.vim'
" Plug 'gu-fan/autotype.vim'

" Integrate GDB.
" Plug 'vim-scripts/Conque-GDB'

" Auto completing suggestions.
" Plug 'Valloric/YouCompleteMe'

" Go support.
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Install the NeoSolarized theme.
" Plug 'iCyMind/NeoSolarized'

