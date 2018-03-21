" Shahzad's Vim Mappings

" Leader Key Mapping.
let mapleader = ","

" Local Leader Key Mapping.
let maplocalleader = "\\"

" Open help in a vertical window instead of a horizontal window.
cnoreabbrev help vert help

" Open a file in read-only mode, in a vertical spilt.
cnoreabbrev vview vert sview

" To quickly jump to normal mode from insert mode.
inoremap jj <Esc>

" Make enter save the current file/buffer, turn highlight off and center the current line.
nnoremap <silent> <Enter> :w<CR>:nohls<CR>zz

" Disable Arrow keys for normal, visual(and select), and operator pending modes.
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Disable Arrow keys for insert mode.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Map Pasting only yanked
nnoremap <Leader>p "0p
nnoremap <Leader>P "0P
vnoremap <Leader>p "0p
vnoremap <Leader>P "0P

" Move vertically by visual line (makes easy to work on wrapped lines).
nnoremap j gj
nnoremap k gk

" Enable the . command (repeating) on all the visually selected lines.
xnoremap . :normal .<CR>

" Enable repeating macros on all the visually selected lines.
xnoremap @ :<C-u>call VisualizeMacro()<CR>

" Fix searching next and previous to center the screen, after taking me there.
nnoremap n nzz
nnoremap N Nzz

" Whenever I go somewhere make it center the screen to that line.
nnoremap gg ggzz
nnoremap G Gzz

" Make Y yank till end of the line (so behaves kind of like C and D).
nnoremap Y y$

" Insert the contents of the clipboard.
nnoremap <Localleader>P :set paste<CR>"+P:set nopaste<CR>
nnoremap <Localleader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <Localleader>p "+p
vnoremap <Localleader>P "+P

" Copy to the clipboaod.
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

" Source ~/.vimrc file.
nnoremap <Leader>sov mm:wa<CR>:source $MYVIMRC<CR>:nohls<CR>`mzz

" Open my vim config files that I modify the most in a new tab.
nnoremap <Leader>vim :tabe ~/.vim/mappings.vim<CR>
                     \:tabe ~/.vim/plug-manager.vim<CR>
                     \:tabe ~/.vim/options.vim<CR>
                     \:tabe ~/.vim/theme.vim<CR>
                     \:tabe ~/.vim/tmux.vim<CR>
                     \:tabe ~/.vim/functions.vim<CR>
                     \:tabe ~/.vim/auto-commands.vim<CR>

" Close all vim config files that are open in tabs, if possible (everything is saved).
nnoremap <Leader>cvim :bd *.vim<C-a><CR>

" Open my tmux configuration file.
nnoremap <Leader>tmux :tabe ~/.tmux/settings.tmux<CR>
                      \:tabe ~/.tmux/bindings.tmux<CR>
                      \:tabe ~/.tmux/theme.tmux<CR>
                      \:tabe ~/.tmux/plugins.tmux<CR>

" Close all tmux config files that are open in tabs, only if everything is saved.
nnoremap <Leader>ctmux :bd *.tmux<C-a><CR>

" Open my bash config files that I modify the most in a new tab.
nnoremap <Leader>bash :tabe ~/.bash/.bash_aliases<CR>
                      \:tabe ~/.bash/.bash_settings<CR>
                      \:tabe ~/.bash/.bash_exports<CR>
                      \:tabe ~/.bash/.bash_functions<CR>
                      \:tabe ~/.bash/.bash_prompt<CR>
                      \:tabe ~/.bash/.bash_system_default<CR>

" Close all bash config files that are open in tabs, if possible (nothing is unsaved).
nnoremap <Leader>cbash :bd *bash_*<C-a><CR>

" Open my profile configuration file.
nnoremap <Leader>pro :tabe ~/.profile<CR>

" Open my input configuration file.
nnoremap <Leader>inp :tabe ~/.inputrc<CR>

" Open my configuration file that contains my environment variables.
nnoremap <Leader>env :tabe ~/.environment_variables<CR>

" Stay in visual mode when indenting.
vnoremap > >gv
vnoremap < <gv

" Equal indent entire file and move my current line to the middle of the screen.
nnoremap <F5> mmgg=G`mzz
vnoremap <F5> =

" Only open the file under the cursor in a new tab if it exists.
nnoremap gf <C-w>gf

" Only open the visually selected file in a new tab if it exists.
vnoremap gf <C-w>gf

" Open file under cursor in a new tab, if it doesn't exist then make a new buffer of it.
nnoremap <Leader>gf :tabe <cfile><CR>

" For easy tab navigation.
nnoremap H gT
nnoremap L gt

" Preserve H (go to the higest visible line on screen).
nnoremap <Leader>hig H

" Preserve L (go to the lowest visible line on screen).
nnoremap <Leader>low L

" Preserve M (go to the middle of the screen).
nnoremap <Leader>mid M

" Map J to go down with x3 times the speed, on normal lines in normal mode.
nnoremap J 3j

" Map J to go down with x3 times the speed on wrapped lines in visual mode.
vnoremap J 3gj

" Join lines using leader, with only one space (preserve J's behaviour).
nnoremap <Leader>j J
vnoremap <Leader>j J

" Join lines without any spaces(only works in normal mode).
nnoremap <Leader>J Jx

" Map K to go up with x3 times the speed, on normal lines in normal mode.
nnoremap K 3k

" Map K to go up with x3 times the speed on wrapped lines in visual mode.
vnoremap K 3gk

" Preserve K's behaviour (open man page of the command the cursor is on).
nnoremap <Leader>man K

" Toggle enableing and disabling of using folds.
nnoremap <Leader>fold :set foldenable!<CR>

" Substitue whatever I searched before with what's under my cursor. Don't <CR> it.
nnoremap <Leader>sub :%s//<c-r><c-a>/gc

" Swap the word under cursor with whatever is in the last yanked register.
nnoremap <Leader>sw diw"0P

" Swap the WORD under cursor with whatever is in the last yanked register.
nnoremap <Leader>sW diW"0P

" Pipe all the commands (all the lines) in file to bash, to get executed one by one.
nnoremap <Leader>bsh :%!bash<CR>

" Delete all recovery files(swaps', undos', and backups'), and come out of the shell.
nnoremap <silent> <Leader>delrec :!rm ~/.vim/.recover/*/{.*,*}{.sw?,~}<CR><CR>

" When taking notes I write the code related things and keywords in ```. So map it.
nnoremap <Leader>` o```yypO

" Zoom the current split buffer horizantally and vertically as many times as I want.
nnoremap <Leader>z :resize<CR>:vertical resize<CR>

" Zoom / restore the current split buffer if not zoomemd before (inspired by tmux's zoom).
nnoremap <Leader>Z :Zoom<CR>

" Set some mappings to quickly turn on or off the auto dictionary completion.
nnoremap <Leader>dico :set complete+=k <CR>
nnoremap <Leader>dicc :set complete-=k <CR>

" --------------------[ Pluggin Specific Mappings ]--------------------

" Quick pluggin managing mappings (not using my sov command to avoid using nmap).
nnoremap <Leader>plugi mm:w<CR>:source $MYVIMRC<CR>`mzz:PlugInstall<CR>
nnoremap <Leader>plugu mm:w<CR>:source $MYVIMRC<CR>`mzz:PlugUpdate<CR>
nnoremap <Leader>plugc mm:w<CR>:source $MYVIMRC<CR>`mzz:PlugClean<CR>

" Mapping to easily merge a tab, as a right vertical split (default <C-w>T undoes this).
nnoremap <C-w>t :Tabmerge right<CR>

" Mapping to quickly open the YCM extra global config file.
nnoremap <Leader>ycm :tabe ~/.vim/extra/YouCompleteMe/.ycm_extra_conf.py<CR>

" Mapping to nerd tree.
nnoremap <Leader>nt :NERDTree<CR>

" Mapping to toggle rainbow parenthesis on or off.
nnoremap <Leader>rain :RainbowToggle<CR>

" Mapping to table mode.
nnoremap <Leader>tm :TableModeToggle<CR>

" Find matching header or source file and vs it (create the matching buffer if not there).
nnoremap <silent> <Leader>O :FSSplitRight<CR>

" Mapping to comment the entire file from current line to the last line.
nmap <Leader>cG mmVG<Leader>cc`mzz

" Make backspace in normal mode toggle commenting and uncommenting.
nmap <BS> <Leader>cizz

" Make backspace in visual mode toggle commenting/uncommenting and stay in visual mode.
vmap <BS> <Leader>cigv

" Visual mode mapping to toggle all lines the same way the first line is toggled.
vmap <Leader><BS> <Leader>c<Space>gv

" Quickly surround this WORD in a string using the surround plugin.
nmap <Leader>str ysiW"

" Default mappings, for when Tmux is not open.
if !exists('${TMUX}') 

    " Map normal vim pane movements 
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " Make using vims built in make.
    nnoremap M :make<CR>

endif " End of the tmux check mappings (to default things, if not inside in tmux).
