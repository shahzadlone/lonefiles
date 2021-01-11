" Shahzad's ALL Common Plugin Specific Mappings.

"=============================================================================== TabMerge
" Mapping to easily merge a tab, as a right vertical split (default <C-w>T undoes this).
nnoremap <C-w>t :Tabmerge right<CR>

"=============================================================================== NerdTree
" Mapping to nerd tree.
nnoremap <Leader>nt :NERDTree<CR>

"===================================================================== RainbowParenthesis
" Mapping to toggle rainbow parenthesis on or off.
nnoremap <Leader>rain :RainbowToggle<CR>

"================================================================================= TagBar
" Toggle the tag bar which contains the tags for this file.
nmap <F8> :TagbarToggle<CR>

"============================================================================== TableMode
" Mapping to table mode.
nnoremap <Leader>tm :TableModeToggle<CR>

"================================================================================ FSwitch
" Find matching header or source file and vs it (create the matching buffer if not there).
nnoremap <silent> <Leader>O :FSSplitRight<CR>

"========================================================================== NerdCommenter
" Mapping to comment the entire file from current line to the last line.
nmap <Leader>cG mmVG<Leader>cc`mzz

" Make backspace in normal mode toggle commenting and uncommenting.
nmap <BS> <Leader>cizz

" Make backspace in visual mode toggle commenting/uncommenting and stay in visual mode.
vmap <BS> <Leader>cigv

" Visual mode mapping to toggle all lines the same way the first line is toggled.
vmap <Leader><BS> <Leader>c<Space>gv

"==================================================================================== Fzf
" Open files with Fzf.
nnoremap <silent> <leader>ff :FzfFiles<CR>

" Open files with Fzf in full screen.
nnoremap <silent> <leader>fF :FzfFiles!<CR>

" Open a list of buffers with Fzf.
nnoremap <silent> <leader>fb :FzfBuffers<CR>

" Open histroy with Fzf in command mode.
cnoremap <silent> <C-p> :FzfHistory:<CR>

"=============================================================================== Surround
" Quickly surround this WORD in a string using the surround plugin.
nmap <Leader>str ysiW"

"============================================================================= EasyMotion
" <Leader>f{char} to move to {char}.
map  <Leader>Fc <Plug>(easymotion-bd-f)
nmap <Leader>Fc <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}.
nmap <Leader>Fb <Plug>(easymotion-overwin-f2)

" Find and move to line.
map <Leader>Fl <Plug>(easymotion-bd-jk)
nmap <Leader>Fl <Plug>(easymotion-overwin-line)

" find and move to word.
map  <Leader>Fw <Plug>(easymotion-bd-w)
nmap <Leader>Fw <Plug>(easymotion-overwin-w)

"=============================================================================== Coc.nvim
" Quick open Coc config.
call MapCommand('Cc', 'CocConfig')

" Use C to open coc config.
call MapCommand('Cu', 'CocUpdate')

"========================================================================== YouCompleteMe
" Mapping to quickly open the YCM extra global config file.
" nnoremap <Leader>ycm :tabe ~/.vim/extra/YouCompleteMe/.ycm_extra_conf.py<CR>

" Mapping to quickly take me to the included file.
" nnoremap <Localleader>gf :YcmCompleter GoToInclude<CR>

" Mapping to quickly take me to the declaration.
" nnoremap <Localleader>gd :YcmCompleter GoToDeclaration<CR>

" Mapping to quickly fix the error using YCM.
" nnoremap <Leader>fix :YcmCompleter FixIt<CR>
