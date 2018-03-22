" Shahzad's Vim Set Options

" Setting the timeout, for leader keys(operator mode time limit) to 5 seconds.
set timeout timeoutlen=5000

" Setting the timeout for keycodes to be less than a 10th of a second.
set timeout ttimeoutlen=99

" Set hybrid line numbers (the current line is absolute and others are relative). I have
"  an auto group with auto commands set up to only show absolute numbers in insert mode.
set number relativenumber

" Disable auto insertion of comments. Only works for one(current session),
"  my auto command fix should resolve that.
set formatoptions-=cro

" Auto save before executing a command.
set autowrite

" Auto read from files to check if external changes made, before executing a command.
set autoread

" Number of spaces a tab has to 4
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Number of spaces in tab when editing
set softtabstop=4

" On pressing tab, insert 4 spaces (turn tabs into spaces).
set expandtab

" Insert just one space joining lines with J.
set nojoinspaces

" Show (partial) command in the status line.
set showcmd

" Don't show matching brackets when typing them.
set noshowmatch

" Make incrementing 007 result into 008 rather than 010.
set nrformats-=octal

" Turn on my searching preference.
set hlsearch  " Highlight search.
set ic        " Ignore case.
set is
set incsearch " Search as characters are entered.

" Set max allowed tabs to be opened.
set tabpagemax=500

" Open vertical panes to the right(not left).
set splitright

" Open horizontal panes to the bottom(not top).
set splitbelow

" Set highlight for 90 characters limit.
set colorcolumn=90
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Show “invisible” characters.
set list
set listchars=tab:┃━,trail:·,eol:☆,nbsp:¬,extends:»,precedes:«

" Highlight current line.
set cursorline

" To show charcter(row) in line.
set ruler

" Show the editing mode on the last line.
set showmode

" Highlight matching [{()}], to the best of vim's ability (not perfect).
set showmatch

" Redraw only when we need to.
set lazyredraw

" Set CMD Mode options.
set shortmess+=raIoOtT
set cmdheight=2

" Visual autocomplete for command menu.
set wildmenu

" Tell vim where to put backup, undo and swapfiles.
set writebackup
set backup
set backupdir=~/.vim/.recover/backup//
set directory=~/.vim/.recover/swap//
set undodir=~/.vim/.recover/undo//

" To set path for searching file.
set path=.,,**

" Set the path to the words of the dictionary to use.
set dictionary+=/usr/share/dict/words

" Make dictionary auto complete off by default (can turn on and off using my mappings).
set complete-=k

" Turn folding on {}.
set foldmarker={,}

" Sets the fold method to {{{ }}} markers.
set foldmethod=marker

" Show closable(-) and openable(+) folds in the left column.
set foldcolumn=2

" Set foldlevel to 1 to see headings of the folds.
set foldlevel=1

" Set folding off by default, can enable using my mapping (<Leader>fold).
set nofoldenable
