"Shahzad's Vim Set Options

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

" Turn on my searching preference
set hlsearch  " Highlight Search
set ic        " Ignore Case
set is
set incsearch " search as characters are entered

" Set max allowed tabs to be opened.
set tabpagemax=500

" Open vertical panes to the right(not left).
set splitright

" Open horizontal panes to the bottom(not top).
set splitbelow

" Set highlight for 90 characters limit
set colorcolumn=90
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" Show “invisible” characters
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:~,extends:>,precedes:<

" Show line numbers
set number

" highlight current line
set cursorline

" To show charcter(row) in line.
set ruler

" Show the editing mode on the last line
set showmode

" highlight matching [{()}]
set showmatch

" redraw only when we need to.v
set lazyredraw

" Set CMD Mode options
set shortmess+=raIoOtT
set cmdheight=2

" visual autocomplete for command menu
set wildmenu

" Tell vim where to put backup, undo and swapfiles.
set writebackup
set backup
set backupdir=~/.vim/.recover/backup//
set directory=~/.vim/.recover/swap//
set undodir=~/.vim/.recover/undo//

" To set path for searching file.
set path=.,,**
