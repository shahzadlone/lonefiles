" Shahzad's ONLY Normal Vim(vim) Specifc Plugin Mappings.

if !has('nvim')

"=============================================================================== NerdTree
" Mapping to nerd tree.
nnoremap <Leader>nt :NERDTreeToggle<CR>


"=============================================================================== Coc.nvim
" Source ~/.vimrc file, update plugins and their extensions.
nnoremap <Leader>soe :wa<CR>:source $MYVIMRC<CR>:CocRestart<CR>:CocUpdate<CR>:nohls<CR>

" Quick open Coc config.
call MapCommand('Cc', 'CocConfig')

" Use C to open coc config.
call MapCommand('Cu', 'CocUpdate')

" Pop-up navigation configs, defaults since: https://github.com/neoclide/coc.nvim/pull/3862
inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"
inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <C-e> coc#pum#visible() ? coc#pum#cancel() : "\<C-e>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-y> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use `<Space>[` and `<Space>g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <Space>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <Space>] <Plug>(coc-diagnostic-next)

" GoTo code navigation.

nmap <silent> <Space>d <Plug>(coc-definition)
nmap <silent> <Space>t <Plug>(coc-type-definition)
nmap <silent> <Space>i <Plug>(coc-implementation)
nmap <silent> <Space>ref <Plug>(coc-references)


" Call eslint to fix all linting errors by using F1.
nnoremap <buffer> <F1> :CocCommand eslint.executeAutofix<CR>

" What I want to accomplish.
" nmap <silent> <Space>ref :vsplit<CR><Plug>(coc-references)<C-W>T
" nmap <silent> <Space>dt :call CocAction('jumpDefinition', 'split')<CR>
" nmap <silent> <Space>dt :call CocAction('jumpDefinition', 'vsplit')<CR>
" nmap <silent> <Space>dt :call CocAction('jumpDefinition', 'tabe')<CR>

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



endif
