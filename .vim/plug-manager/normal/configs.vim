" Shahzad's Normal-Vim(vim) Specific Plugin Configurations ONLY.

if !has('nvim')

"=============================================================================== Coc.nvim
let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-diagnostic',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-graphql',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-lua',
    \ 'coc-prettier',
    \ 'coc-prisma',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-sql',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-yaml'
    \]

"---------------------------------------- coc-pairs
" \'coc-pairs',
" autocmd FileType cpp let b:coc_pairs_disabled = ['<']
" autocmd FileType tex let b:coc_pairs = [["$", "$"]]

"________________________________________________________________________________________


"============================================================================== GitGutter
" GitGutter default configurations.
let g:gitgutter_enabled = 1         " Default 1.
let g:gitgutter_signs = 1           " Default 1.
let g:gitgutter_highlight_lines = 0 " Default 0.
let g:gitgutter_max_signs = 5000    " Default 500.

" Sign styles.
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" For focus events reporting.
let g:gitgutter_terminal_reports_focus=0

" Go to next / previous git hunk.
nmap g] <Plug>(GitGutterNextHunk)
nmap g[ <Plug>(GitGutterPrevHunk)


"============================================================================ NerdTreeGit
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \}

endif
