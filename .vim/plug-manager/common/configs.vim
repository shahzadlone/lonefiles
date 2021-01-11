" Shahzad's All Common Plugin Configurations.

"=============================================================================== Coc.nvim
let g:coc_global_extensions = [
      \'coc-git',
      \'coc-clangd',
      \'coc-cmake',
      \'coc-html',
      \'coc-css',
      \'coc-tsserver',
      \'coc-cssmodules',
      \'coc-highlight',
      \'coc-vimlsp',
      \'coc-json'
      \]
"======================================================================== LspCxxHighlight
" vim-lsp-cxx-highlight's support for text properties.
let g:lsp_cxx_hl_use_text_props = 1

"==================================================================================== Fzf
" Add namespace for fzf.vim commands.
let g:fzf_command_prefix = 'Fzf'

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
" Rainbow parenthesis configurations.
" Turn it on by default.
let g:rainbow_active = 1 " Default 0, enable with :RainbowToggle if not on.

"=============================================================================== SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'

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
