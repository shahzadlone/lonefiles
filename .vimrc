" Shahzad's Vim Configurations(.vimrc)

filetype plugin indent on

" Enable syntax highlighting
syntax on

" Fix color issue with tmux
set background=dark
set t_Co=256

" Disable auto insertion of comments.
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

" On pressing tab, insert 4 spaces ( turn tabs into spaces )
set expandtab

" Turn on my searching preference
set hlsearch  " Highlight Search
set ic        " Ignore Case
set is
set incsearch " search as characters are entered

" Set max allowed tabs to be opened.
set tabpagemax=100

" set highlight for 90 characters limit
set colorcolumn=90
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

" to see tabs
set list
set listchars=tab:>-

" move vertically by visual line
nnoremap j gj
nnoremap k gk

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
set shortmess=a
set cmdheight=2

 " visual autocomplete for command menu
set wildmenu

" Tell vim to keep a backup file
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Set color scheme (these are some good ones to download: cobalt, monokai-soda, monokai, lyla, neuromancer).
colorscheme darkblue

" Disable Arrow keys.
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Map Pasting only yanked
nnoremap p "0p
nnoremap P "0P
nnoremap "0p p
nnoremap "0P P
vnoremap p "0p
vnoremap P "0P
vnoremap "0p p
vnoremap "0P P

" To set path for searching file.
set path=.,,**

" Function to help trim trailing whitespace.
fun! TrimTrailingWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! Tws call TrimTrailingWhitespace() " So easier to call.

" Smart window switching with awareness of Tmux panes. Now, I can use
" Ctrl+hjkl
" " in both Vim and Tmux (without using the prefix). Based on
" " http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits.
" " Note: I do not use https://github.com/christoomey/vim-tmux-navigator
" because
" "       it does not work when vim is run over ssh.
if exists('$TMUX')
    function! s:TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute 'wincmd ' . a:wincmd
        if previous_winnr == winnr()
            call system('tmux select-pane -' . a:tmuxdir)
            redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" .  &t_ti
    let &t_te = "\<Esc>]2;" .  previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call <SID>TmuxOrSplitSwitch('h', 'L')<CR>
    nnoremap <silent> <C-j> :call <SID>TmuxOrSplitSwitch('j', 'D')<CR>
    nnoremap <silent> <C-k> :call <SID>TmuxOrSplitSwitch('k', 'U')<CR>
    nnoremap <silent> <C-l> :call <SID>TmuxOrSplitSwitch('l', 'R')<CR>
else
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
endif
