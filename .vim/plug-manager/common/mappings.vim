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

"============================================================================== TableMode
" Mapping to table mode.
nnoremap <Leader>tm :TableModeToggle<CR>

"================================================================================ FSwitch
" Find matching header or source file and vs it (create the matching buffer if not there).
nnoremap <silent> <Leader>O :FSSplitRight<CR>

"========================================================================== OerdCommenter
" Mapping to comment the entire file from current line to the last line.
nmap <Leader>cG mmVG<Leader>cc`mzz

" Make backspace in normal mode toggle commenting and uncommenting.
nmap <BS> <Leader>cizz

" Make backspace in visual mode toggle commenting/uncommenting and stay in visual mode.
vmap <BS> <Leader>cigv

" Visual mode mapping to toggle all lines the same way the first line is toggled.
vmap <Leader><BS> <Leader>c<Space>gv

"=============================================================================== Surround
" Quickly surround this WORD in a string using the surround plugin.
nmap <Leader>str ysiW"

"============================================================================= EasyMotion
" <Leader>f{char} to move to {char}.
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}.
nmap s <Plug>(easymotion-overwin-f2)

" Move to line.
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word.
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

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
