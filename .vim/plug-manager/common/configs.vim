" Shahzad's All Common Plugin Configurations.

"=============================================================================== Coc.nvim
let g:coc_global_extensions = [
      \'coc-actions',
      \'coc-clangd',
      \'coc-cmake',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-eslint',
      \'coc-git',
      \'coc-go',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-prettier',
      \'coc-prisma',
      \'coc-snippets',
      \'coc-sql',
      \'coc-tsserver',
      \'coc-vimlsp'
      \]
"---------------------------------------- coc-pairs
      " \'coc-pairs',
" autocmd FileType cpp let b:coc_pairs_disabled = ['<']
" autocmd FileType tex let b:coc_pairs = [["$", "$"]]

"________________________________________________________________________________________

"============================================================================= IndentLine
" To set the default plugin colour for indenting off.
let g:indentLine_setColors = 1

" Show each indent level by a distinct char.
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"======================================================================== LspCxxHighlight
" vim-lsp-cxx-highlight's support for text properties.
let g:lsp_cxx_hl_use_text_props = 1

"============================================================================= FatihVimGo
let g:go_fmt_command = "goimports"
let g:go_decls_mode = "fzf"
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_space_tab_error = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_echo_command_info = 0
let g:go_mod_fmt_autosave = 0

"==================================================================================== Fzf
" Add namespace for fzf.vim commands.
let g:fzf_command_prefix = 'Fzf'

"===================================================================== VimMarkDownPreview
" Set markdown preview server (to handle wsl case).
" let g:mkdp_browser = 'edge'

"============================================================================ VimMarkDown
" Enable markdown folding.
let g:vim_markdown_folding_disabled = 0

" Enable table of content window to auto-fit (shrink or stay the same).
let g:vim_markdown_toc_autofit = 1

" Enable LaTex syntax.
let g:vim_markdown_math = 1

" Enable YAML front matter.
let g:vim_markdown_frontmatter = 1

" Enable JSON front matter.
let g:vim_markdown_json_frontmatter = 1

" Enable strikethrough.
let g:vim_markdown_strikethrough = 1

" Indent by 4 spaces.
let g:vim_markdown_new_list_item_indent = 4

" Open new files or urls in new tab.
let g:vim_markdown_edit_url_in = 'tab'

" Disable default key mappings.
" let g:vim_markdown_no_default_key_mappings = 1

" Fenced code block languages.
" let g:vim_markdown_fenced_languages = ['csharp=cs']

"================================================================================ FSwitch
" Source and header files configurations for f-switch.
au! BufEnter *.cpp,*.cc,*.c let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './,./**'
au! BufEnter *.hpp,*.h let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = './,./**'

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

"========================================================================= MatchTagAlways
" To make MatchTagAlways do the tag matching for these files.
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

"================================================================================= VimVue
" Configuration Options for the vim-vue plugin.
" Everytime a vue file is opened start syntax higlighting.
autocmd FileType vue syntax sync fromstart
" Disable checking for pre-processors.
let g:vue_disable_pre_processors=1

"============================================================================== UltiSnips
" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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
    \ }

"========================================================================== NerdCommenter
" NerdCommenter configurations.
" Enable trimming of trailing whitespace when uncommenting, for nerdcommenter.
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting/uncommenting empty lines (useful when commenting a region).
let g:NERDCommentEmptyLines = 1
" Align line-wise comment delimiters flush left instead of following code indentation.
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default.
let g:NERDSpaceDelims = 1

"===================================================================== RainbowParenthesis
let g:rainbow#max_level = 11
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

" Activation based on file type.
augroup rainbow_parenthsis
    autocmd!
    autocmd FileType * RainbowParentheses
augroup END

" List of colors that you do not want. ANSI code or #RRGGBB
" let g:rainbow#blacklist = [233, 234]
"=============================================================================== SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'

"=============================================================================== Prettier
" nmap <F1> <Plug>(Prettier)

"========================================================================== YouCompleteMe
"" Make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"" Tell vim where the default global settings are located.
"let g:ycm_global_ycm_extra_conf = '~/.vim/extra/YouCompleteMe/.ycm_extra_conf.py'

"=================================================================== CppEnhancedHighlight
" C++ syntax highlight configurations.
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:c_no_curly_error = 1

"============================================================================== ConqueGDB
" GDB plugin configs.
" let g:ConqueTerm_Color = 2    " 1: strip color after 200 lines, 2: always with color

" ========[ Configure Verbose Plugins (plugins with long configuration formats) ]========
" Configure all the common plugins according to my preference.
source ~/.vim/plug-manager/common/configs-verbose.vim
