" Shahzad's All Common Plugin Configurations.

"=============================================================================== Coc.nvim
let g:coc_global_extensions = [
      \'coc-git',
      \'coc-clangd',
      \'coc-cmake',
      \'coc-html',
      \'coc-css',
      \'coc-highlight',
      \'coc-vimlsp',
      \'coc-json'
      \]
"======================================================================== LspCxxHighlight
" vim-lsp-cxx-highlight's support for text properties.
let g:lsp_cxx_hl_use_text_props = 1

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
