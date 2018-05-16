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

" Insert the contents of the clipboard, in normal mode.
nnoremap <Localleader>P :set paste<CR>"+P:set nopaste<CR>
nnoremap <Localleader>p :set paste<CR>"+p:set nopaste<CR>

" Insert the contents of the clipboard, in operator pending mode (one normal command).
" onoremap <Localleader>P :set paste<CR><C-o>"+P<C-o>:set nopaste<CR>
" onoremap <Localleader>p :set paste<CR><C-o>"+p<C-o>:set nopaste<CR>
" onoremap <Localleader>p <ESC>:set paste"+p:set nopdaste<CR>

" Insert the contents of the clipboard, on top of the visually selected text.
vnoremap <Localleader>p "+p
vnoremap <Localleader>P "+P

" Copy to the clipboaod.
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

" Source ~/.vimrc file.
nnoremap <Leader>sov mm:wa<CR>:source $MYVIMRC<CR>:nohls<CR>`mzz

" Open my vim config files that I modify the most in a new tab.
nnoremap <Leader>vim :tabe ~/.vim/mappings.vim<CR>
                     \:tabe ~/.vim/plug-manager/manager.vim<CR>
                     \:tabe ~/.vim/options.vim<CR>
                     \:tabe ~/.vim/theme.vim<CR>
                     \:tabe ~/.vim/tmux.vim<CR>
                     \:tabe ~/.vim/functions.vim<CR>
                     \:tabe ~/.vim/auto-commands.vim<CR>
                     \:tabe ~/.vim/neovim.vim<CR>
                     \:tabe ~/.config/nyaovim/nyaovimrc.html<CR>

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

" Open my lonify scripts.
nnoremap <Leader>scri :tabe ~/.scripts/lonefigure.sh<CR>
                      \:tabe ~/.scripts/lonependencies.sh<CR>
                      \:tabe ~/.scripts/lonestall.sh<CR>
                      \:tabe ~/.scripts/lonify.sh<CR>

" Open my profile configuration file.
nnoremap <Leader>pro :tabe ~/.profile<CR>

" Open my input configuration file.
nnoremap <Leader>inp :tabe ~/.inputrc<CR>

" Open my configuration file that contains my environment variables.
nnoremap <Leader>env :tabe ~/.environment_variables<CR>

" Open my git configuration file.
nnoremap <Leader>git :tabe ~/.gitconfig<CR>

" Stay in visual mode when indenting.
vnoremap > >gv
vnoremap < <gv

" Opens the url in the browser of my choice.
nnoremap <Leader>url :OpenUrl<CR>

" Indent, retab (tabs to spaces) and trim trailing white space in the entire file.
nnoremap <silent> <F5> mmgg=G:retab<CR>:Tws<CR>`mzz
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
nnoremap <Leader>sub :%s//<C-r><C-a>/gc

" Swap the word under cursor with whatever is in the last yanked register.
nnoremap <Leader>sw diw"0P

" Swap the WORD under cursor with whatever is in the last yanked register.
nnoremap <Leader>sW diW"0P

" Pipe all the commands (all the lines) in file to bash, to get executed one by one.
nnoremap <Leader>bsh :%!bash<CR>

" Delete all recovery files(swaps', undos', and backups'), and come out of the shell.
nnoremap <silent> <Leader>delrec :!rm ~/.vim/.recover/*/{.*,*}{.sw?,~}<CR><CR>

" Search for visually selected text, forwards.
vnoremap <silent> * :<C-U>let old_reg=getreg('"')
                     \<Bar>let old_regtype=getregtype('"')<CR>
                     \gvy/<C-r><C-r>=substitute(escape(@", '/\.*$^~['), '\_s\+',
                     \                          '\\_s\\+', 'g')<CR>
                     \<CR>gV:call setreg('"', old_reg, old_regtype)<CR>

" Search for visually selected text, backwards.
vnoremap <silent> # :<C-U>let old_reg=getreg('"')
                     \<Bar>let old_regtype=getregtype('"')<CR>
                     \gvy?<C-r><C-r>=substitute(escape(@", '?\.*$^~['), '\_s\+',
                     \                          '\\_s\\+', 'g')<CR>
                     \<CR>gV:call setreg('"', old_reg, old_regtype)<CR>

" When taking notes I write the code related things and keywords in ```. So map it.
nnoremap <Leader>` o```yypO

" Zoom the current split buffer horizantally and vertically as many times as I want.
nnoremap <Leader>z :resize<CR>:vertical resize<CR>

" Zoom / restore the current split buffer if not zoomemd before (inspired by tmux's zoom).
nnoremap <Leader>Z :Zoom<CR>

" Set some mappings to quickly turn on or off the auto dictionary completion.
nnoremap <Leader>dico :set complete+=k <CR>
nnoremap <Leader>dicc :set complete-=k <CR>

" Quick pluggin managing mappings (not using my sov command to avoid using nmap).
nnoremap <Leader>plugi mm:w<CR>:source $MYVIMRC<CR>`mzz:PlugInstall<CR>
nnoremap <Leader>plugu mm:w<CR>:source $MYVIMRC<CR>`mzz:PlugUpdate<CR>
nnoremap <Leader>plugc mm:w<CR>:source $MYVIMRC<CR>`mzz:PlugClean<CR>

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

" ====================[ In The End Map My Plug-In Specific Mappings ]====================

" Map all the common plugin specific key bindings according to my preference.
source ~/.vim/plug-manager/common/mappings.vim

" Bind only neovim plugins specific key bindings, according to my preference.
source ~/.vim/plug-manager/neo/mappings.vim

" Bind only normal vim plugins specific key bindings, according to my preference.
source ~/.vim/plug-manager/normal/mappings.vim
