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
