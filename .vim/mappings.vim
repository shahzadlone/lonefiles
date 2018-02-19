" Shahzad's Vim Mappings

" Leader Key Mapping.
let mapleader = ","

" Local Leader Key Mapping.
let maplocalleader = "\\"

" Open help in a vertical window instead of a horizontal window.
cnoreabbrev help vert help

" Move vertically by visual line (makes easy to work on wrapped lines).
nnoremap j gj
nnoremap k gk

" Disable Arrow keys in Escape mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Map Pasting only yanked
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P
vnoremap <Leader>p "0p
vnoremap <Leader>P "0P

"Fix searching next and previous to center the screen, after taking me there.
nnoremap n nzz
nnoremap N Nzz

" Make Y yank till end of the line (so behaves kind of like C and D).
nnoremap Y y$

"" Insert the contents of the clipboard.
"nnoremap <silent> <Localleader>P :set paste<CR>"*]P:set nopaste<CR>
"nnoremap <silent> <Localleader>p :set paste<CR>"*]p:set nopaste<CR>
"vnoremap          <Localleader>p "*p
"vnoremap          <Localleader>P "*P
"
"" Copy the selected text into the clipboard.
"noremap <Localleader>y "*y
"
"" Copy to the clipboard.
"noremap <Leader>y "+y

" Mapping to nerd tree.
noremap <Leader>nt :NERDTree<cr>

" Mapping to table mode.
noremap <Leader>tm :TableModeToggle<cr>

" Stay in visual mode when indenting.
vnoremap > >gv
vnoremap < <gv

" Equal indent entire file and move my current line to the middle of the screen.
nnoremap <F5> mmgg=G`mzz
vnoremap <F5> =

" Open the file under cursor(or visually selected) in a new tab.
nnoremap gf <C-w>gf
vnoremap gf <C-w>gf

" For easy tab navigation.
nnoremap <S-h> gT
nnoremap <S-l> gt

" Make(build) in current directory.
nnoremap <S-m> :make!<cr>

" Preserve H (go to the higest visible line on screen).
nnoremap <Leader>h <S-h>

" Preserve L (go to the lowest visible line on screen).
nnoremap <Leader>l <S-l>

" Preserve M (go to the middle of the screen).
nnoremap <Leader>m <S-m>

" Source ~/.vimrc file.
nnoremap <Leader>sov mm:wa<CR>:source $MYVIMRC<cr>`mzz

" Open my vim config files that I modify the most in a new tab.
nnoremap <Leader>vim :tabe ~/.vim/mappings.vim<cr>
                      \:tabe ~/.vim/plug-manager.vim<cr>
                      \:tabe ~/.vim/options.vim<cr>
                      \:tabe ~/.vim/theme.vim<cr>

" Close all vim config files that are open in tabs, if possible (everything is saved).
nnoremap <Leader>cvim :bd *.vim<C-a><cr>

" Open my bash config files that I modify the most in a new tab.
nnoremap <Leader>bash :tabe ~/.bash/.bash_aliases<cr>
                       \:tabe ~/.bash/.bash_settings<cr>
                       \:tabe ~/.bash/.bash_exports<cr>
                       \:tabe ~/.bash/.bash_system_default<cr>

" Close all bash config files that are open in tabs, if possible (nothing is unsaved).
nnoremap <Leader>cbash :bd *bash_*<C-a><cr>

" Map J to go down with x3 times the speed.
noremap J 3j

" Join lines using leader, with only one space (preserve J's behaviour).
noremap <Leader>j J

" Join lines without any spaces.
noremap <Leader>J Jx

" Map K to go up with x3 times the speed.
noremap K 3k

" Preserve K's behaviour (open man page of the command the cursor is on).
noremap <Leader>man K

" Pipe all the commands (all the lines) in file to bash, to get executed one by one.
noremap <Leader>bsh :%!bash<cr>

" Delete all recovery files(swaps, undos, and backups), and come out of the shell.
noremap <silent> <Leader>delrec :!rm ~/.vim/.recover/*/{.*,*}{.sw?,~}<cr><cr>
