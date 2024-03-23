" Shahzad's Vim Plugins that are common for BOTH Vims' (compatible with NeoVim and Vim).


"==============================================================[ Behavioural Vim Plugins ]
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

" For easier commenting using <Leader> and 'c' command with combinations.
Plug 'preservim/nerdcommenter'

" Provide a start screen.
Plug 'mhinz/vim-startify'

" For using icons and nerd fonts.
Plug 'ryanoasis/vim-devicons'

" To help make the interaction with tmux seemless.
Plug 'benmills/vimux'
" Make vim aware of .tmux.conf syntax highlighting, and add support to jump to man page.
Plug 'tmux-plugins/vim-tmux'

" To get the Table Mode.
Plug 'dhruvasagar/vim-table-mode'

" Org mode for vim.
Plug 'jceb/vim-orgmode'

" Git gutter to show modified lines in file.
Plug 'airblade/vim-gitgutter'

" Change the directory to the root of the project.
Plug 'airblade/vim-rooter'

" Status bar.
Plug 'vim-airline/vim-airline'
" Status bar themes.
Plug 'vim-airline/vim-airline-themes'

" Calendar support.
Plug 'mattn/calendar-vim'

" Help align text that matches a pattern.
Plug 'godlygeek/tabular'

" Extend matching behaviour of % like match-it plugin.
Plug 'andymass/vim-matchup'

" Emac's narrowing feature.
Plug 'chrisbra/NrrwRgn'

" Split statements into multiple lines or join them into one.
Plug 'AndrewRadev/splitjoin.vim'

" Fuzzy Finder, keep latest binary and the plugin.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Distraction free writing mode.
Plug 'junegunn/goyo.vim'

" To get rainbow nested parenthesis.
Plug 'junegunn/rainbow_parentheses.vim'

" Better macro and copy register visualization.
Plug 'junegunn/vim-peekaboo'

" Easy motion.
Plug 'easymotion/vim-easymotion'

"========================================================[ Language Specific Vim Plugins ]

"--------------------------------------------------( C++ )
" Easily switch between the header and source files.
Plug 'derekwyatt/vim-fswitch'

" C/C++/ObjC semantic highlighting using the language server protocol (LSP). 
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Bazel build.
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" TagList for source code browsing.
" Plug 'yegappan/taglist'

" Side panel to show all the tags within scope.
" Plug 'preservim/tagbar'

"---------------------------------------------( Frontend )
" Syntax highlighting, matching rules and mappings for markdown and extensions.
Plug 'plasticboy/vim-markdown'

" Markdown preview.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" TypeScript syntax higlighting.
Plug 'HerringtonDarkholme/yats.vim'

" Better indentation and syntax for TypeScript.
Plug 'leafgarland/typescript-vim'

" Auto matching html tags.
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'xhtml', 'xml', 'jinja' ] }

" Better colour higlighting for Vue.js syntax.
Plug 'posva/vim-vue'

" Better GraphQL highlighting (supports only prisma 1, so only use for GraphQL).
Plug 'jparise/vim-graphql'

" Prisma 2 file detection and syntax higlighting.
Plug 'pantharshit00/vim-prisma'

" Prettyfy only for selected files (must have yarn installed):
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': [
      \'javascript', 
      \'typescript', 
      \'css', 
      \'less', 
      \'scss', 
      \'json', 
      \'graphql', 
      \'markdown', 
      \'vue', 
      \'svelte', 
      \'yaml', 
      \'html'
      \] }

"------------------------------------------( Other / Mix )
" Quick latex completion.
Plug 'brennier/quicktex'
" Quick latex compilation.
Plug 'lervag/vimtex'

" To get quick snippets.
Plug 'SirVer/ultisnips', { 'for': ['c', 'cpp'] }
Plug 'honza/vim-snippets', { 'for': ['c', 'cpp'] }

" Support for multiple syntax types in one file.
Plug 'inkarkat/vim-SyntaxRange'

" Language packs for better syntax highlighting.
Plug 'sheerun/vim-polyglot'

" For Go support. 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" These help print debug statements:
Plug 'sentriz/vim-print-debug'
Plug 'meain/vim-printer'

"============================================================[ Theme Related Vim Plugins ]
" OneDark theme.
Plug 'joshdick/onedark.vim'

" Nord theme.
Plug 'arcticicestudio/nord-vim'

" Monokai theme.
Plug 'sickill/vim-monokai'

"============================================================[ Old / Deactivated Plugins ]
" OneNord theme.
" Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }

" OneDark theme.
" Plug 'navarasu/onedark.nvim'

" Gruvbox theme.
" Plug 'morhetz/gruvbox'

" NeoSolarized theme.
" Plug 'overcache/NeoSolarized'

" Super tab to make compatible YCM and UltiSnip with tab.
" Plug 'ervandew/supertab'

" Better JSON support.
" Plug 'elzr/vim-json'

" Display vertical line indentation levels for code.
"Plug 'Yggdroot/indentLine'

" Vimwiki note taking.
" Plug 'vimwiki/vimwiki'

" Fade / Dim vim windows.
" Plug 'TaDaa/vimade'

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

" Plug 'bergercookie/vim-debugstring'

" Nerd Tree syncronized with vim tabs.
" Plug 'jistr/vim-nerdtree-tabs'

" Replaced by CHADTree
"" Nerd Tree for easier files, directory navigation.
"Plug 'preservim/nerdtree'
"" Nerd Tree git support,
"Plug 'Xuyuanp/nerdtree-git-plugin'
"" For nerd tree highlighting (needs devicons).
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"
