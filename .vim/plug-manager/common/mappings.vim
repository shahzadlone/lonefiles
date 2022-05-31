" Shahzad's ALL Common Plugin Specific Mappings.

"=============================================================================== TabMerge
" Mapping to easily merge a tab, as a right vertical split (default <C-w>T undoes this).
nnoremap <C-w>t :Tabmerge right<CR>

"=============================================================================== NerdTree
" Mapping to nerd tree.
nnoremap <Leader>nt :NERDTreeToggle<CR>

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
nnoremap <silent> <leader>ff :tabedit<CR>:Ff<CR>

" Open files with Fzf.
nnoremap <silent> <leader>fF :FF<CR>

" Do a rip grep search using fzf in full screen, and open the selection in a new tab.
nnoremap <silent> <leader>fr :tabedit<CR>:Fr<CR>

" Do a rip grep search using fzf.
nnoremap <silent> <leader>fR :FR<CR>

" Open a list of buffers with Fzf, in full screen, and open the selection in a new tab.
nnoremap <silent> <leader>fb :tabedit<CR>:FzfBuffers!<CR>

" Open a list of buffers with Fzf.
nnoremap <silent> <leader>fB :FzfBuffers<CR>

" Open history of recent files, in full screen and open the selection in a new tab.
nnoremap <silent> <leader>fh :tabedit<CR>:FzfHistory!<CR>

" Open history of recent files using Fzf.
nnoremap <silent> <leader>fH :FzfHistory<CR>

" Open history with Fzf in command mode.
cnoremap <silent> <C-p> :FzfHistory:<CR>

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

"=============================================================================== Coc.nvim
" Quick open Coc config.
call MapCommand('Cc', 'CocConfig')

" Use C to open coc config.
call MapCommand('Cu', 'CocUpdate')

" Call eslint to fix all linting errors by using F1.
nnoremap <buffer> <F1> :CocCommand eslint.executeAutofix<CR>

" Use <C-n> to trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <C-y> pumvisible() ? coc#_select_confirm()
                             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif

" Use `<Space>[` and `<Space>g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <Space>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <Space>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.

nmap <silent> <Space>d <Plug>(coc-definition)
nmap <silent> <Space>t <Plug>(coc-type-definition)
nmap <silent> <Space>i <Plug>(coc-implementation)
nmap <silent> <Space>ref <Plug>(coc-references)

" What I want to accomplish.
" nmap <silent> <Space>ref :vsplit<CR><Plug>(coc-references)<C-W>T
" nmap <silent> <Space>d :call CocAction('jumpDefinition', 'tabe')<CR>
" nmap <silent> <Leader><Space>vd :call CocAction('jumpDefinition', 'vsplit')<CR>
" nmap <silent> <Leader><Space>d <Plug>(coc-definition)

" What someone else did:
" nmap <silent> \ge <Plug>(coc-definition)
" nmap <silent> \gs :sp<CR><Plug>(coc-definition)
" nmap <silent> \gv :vsp<CR><Plug>(coc-definition)
" nmap <silent> \gt :vsp<CR><Plug>(coc-definition)<C-W>T

" Symbol renaming.
nmap <Space>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> <Space>k :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <Space>= <Plug>(coc-format-selected)
nmap <Space>= <Plug>(coc-format-selected)

augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <Space>fix  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.{}
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Remap <C-n> and <C-p> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
  " nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-n>"
  " nnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-p>"
  " inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  " inoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  " vnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-n>"
  " vnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-p>"
" endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)

"========================================================================== YouCompleteMe
" Mapping to quickly open the YCM extra global config file.
" nnoremap <Leader>ycm :tabe ~/.vim/extra/YouCompleteMe/.ycm_extra_conf.py<CR>

" Mapping to quickly take me to the included file.
" nnoremap <Localleader>gf :YcmCompleter GoToInclude<CR>

" Mapping to quickly take me to the declaration.
" nnoremap <Localleader>gd :YcmCompleter GoToDeclaration<CR>

" Mapping to quickly fix the error using YCM.
" nnoremap <Leader>fix :YcmCompleter FixIt<CR>

"=========================================================================== NerdTreeTabs
" Mapping to nerd tree.
" nnoremap <Leader>nn <plug>NERDTreeTabsToggle<CR>

