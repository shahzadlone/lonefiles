" Shahzad's ALL Common Plugin Specific Mappings.

"============================================================================== VimRooter
" note: The config options are defined in `~/.vim/plug-manager/common/configs.vim`

" Mapping to manually call rooter.
nnoremap <leader>~ :Rooter<CR>

"=============================================================================== TabMerge
" Mapping to easily merge a tab, as a right vertical split (default <C-w>T undoes this).
nnoremap <C-w>t :Tabmerge right<CR>

"===================================================================== RainbowParenthesis
" note: The config options are defined in `~/.vim/plug-manager/common/configs.vim`

" Mapping to toggle rainbow parenthesis on or off.
nnoremap <Leader>rain :RainbowToggle<CR>

"============================================================================== TableMode
" Mapping to table mode.
nnoremap <Leader>tm :TableModeToggle<CR>

"================================================================================ FSwitch
" Find matching header or source file and vs it (create the matching buffer if not there).
nnoremap <silent> <Leader>O :FSSplitRight<CR>

"========================================================================== VimPrintDebug
" note: The config options are defined in `~/.vim/plug-manager/common/configs.vim`

nnoremap <Leader>lf :call print_debug#print_debug()<CR>

"========================================================================== NerdCommenter
" Mapping to comment the entire file from current line to the last line.
nmap <Leader>cG mmVG<Leader>cc`mzz

" Make backspace in normal mode toggle commenting and uncommenting.
nmap <BS> <Leader>cizz

" Make backspace in visual mode toggle commenting/uncommenting and stay in visual mode.
vmap <BS> <Leader>cigv

" Visual mode mapping to toggle all lines the same way the first line is toggled.
vmap <Leader><BS> <Leader>c<Space>gv

"================================================================================ Tabular
if exists(":Tabularize")
    " Align the lines with respect to the equal sign.
    nnoremap <Leader>= :Tabularize /=<CR>
    vnoremap <Leader>= :Tabularize /=<CR>
    nnoremap <Leader>== :Tabularize /=\zs<CR>
    vnoremap <Leader>== :Tabularize /=\zs<CR>

    " Align the lines with respect to the colon.
    nnoremap <Leader>: :Tabularize /:<CR>
    vnoremap <Leader>: :Tabularize /:<CR>
    nnoremap <Leader>:: :Tabularize /:\zs<CR>
    vnoremap <Leader>:: :Tabularize /:\zs<CR>

    " Function to help keep aligning on the fly.
    function! s:align()
        let p = '^\s*|\s.*\s|\s*$'
        if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
        endif
    endfunction

    " Use the above function everytime we type Bars/Pipes in insert mode.
    inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

endif

"==================================================================================== Fzf
" note: The config options are defined in `~/.vim/plug-manager/common/configs.vim`

"command! -bang -nargs=* Frg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always ' 
"  \  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

" Original Command:
" command! -bang -nargs=* RRR
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case -- '
"   \   .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" Fzf to be smart enough to start in the root of the project (where .git is located).
command! Ff execute 'FzfFiles!' FindGitRootDir()
command! FF execute 'FzfFiles' FindGitRootDir()
command! Fr execute 'FzfRg!'
command! FR execute 'FzfRg'
" TODO, make rip grep search files in root dir too.
" command! Fr execute 'Frg!' FindGitRootDir()
" command! FR execute 'Frg' FindGitRootDir()


" Open files with Fzf in full screen, and open the selected file in a new tab.
nnoremap <silent> <LocalLeader>ff :tabedit<CR>:Ff<CR>

" Open files with Fzf.
nnoremap <silent> <LocalLeader>fF :FF<CR>

" Do a rip grep search using fzf in full screen, and open the selection in a new tab.
nnoremap <silent> <LocalLeader>fr :tabedit<CR>:Fr<CR>

" Do a rip grep search using fzf.
nnoremap <silent> <LocalLeader>fR :FR<CR>

" Open a list of buffers with Fzf, in full screen, and open the selection in a new tab.
nnoremap <silent> <LocalLeader>fb :tabedit<CR>:FzfBuffers!<CR>

" Open a list of buffers with Fzf.
nnoremap <silent> <LocalLeader>fB :FzfBuffers<CR>

" Open history of recent files, in full screen and open the selection in a new tab.
nnoremap <silent> <LocalLeader>fh :tabedit<CR>:FzfHistory!<CR>

" Open history of recent files using Fzf.
nnoremap <silent> <LocalLeader>fH :FzfHistory<CR>

" Open history with Fzf in command mode.
cnoremap <silent> <LocalLeader><C-p> :FzfHistory:<CR>

"=============================================================================== Surround
" Quickly surround this WORD in string using the surround plugin.
nmap <Leader>ss ysiW"

" Quickly surround this WORD in quotes using the surround plugin.
nmap <Leader>sq ysiW'

" Quickly surround this WORD in ticks using the surround plugin.
nmap <Leader>st ysiW`

" Quickly surround this WORD in curly braces using the surround plugin.
nmap <Leader>s{ ysiW{
nmap <Leader>s} ysiW}

" Quickly surround this WORD in square brackets using the surround plugin.
nmap <Leader>s[ ysiW[
nmap <Leader>s] ysiW]

" Quickly surround this WORD in parentheses using the surround plugin.
nmap <Leader>s( ysiW(
nmap <Leader>s) ysiW)

" Quickly surround this WORD in angle brackets or the chevrons using the surround plugin.
nmap <Leader>s> ysiW>

" Quickly surround this WORD in a tag using the surround plugin.
nmap <Leader>s< ysiW<

"=============================================================================== Prettier
" note: The config options are defined in `~/.vim/plug-manager/common/configs.vim`

" USe <F6> to format using prettier if the file type supports it.
nmap <F6> <Plug>(PrettierAsync)
vnoremap <F6> :PrettierAsync<CR>

"============================================================================= EasyMotion
" <Leader>f{char} to move to {char}.
map  <Leader>F1 <Plug>(easymotion-bd-f)
nmap <Leader>F1 <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}.
nmap <Leader>F2 <Plug>(easymotion-overwin-f2)

" Find and move to line.
map <Leader>Fl <Plug>(easymotion-bd-jk)
nmap <Leader>Fl <Plug>(easymotion-overwin-line)

" find and move to word.
map  <Leader>Fw <Plug>(easymotion-bd-w)
nmap <Leader>Fw <Plug>(easymotion-overwin-w)

"================================================================================= TagBar
" Toggle the tag bar which contains the tags for this file.
" nmap <F8> :TagbarToggle<CR>

"========================================================================== YouCompleteMe
" Mapping to quickly open the YCM extra global config file.
" nnoremap <Leader>ycm :tabe ~/.vim/extra/YouCompleteMe/.ycm_extra_conf.py<CR>

" Mapping to quickly take me to the included file.
" nnoremap <LocalLeader>gf :YcmCompleter GoToInclude<CR>

" Mapping to quickly take me to the declaration.
" nnoremap <LocalLeader>gd :YcmCompleter GoToDeclaration<CR>

" Mapping to quickly fix the error using YCM.
" nnoremap <Leader>fix :YcmCompleter FixIt<CR>

"=========================================================================== NerdTreeTabs
" Mapping to nerd tree.
" nnoremap <Leader>nn <plug>NERDTreeTabsToggle<CR>

