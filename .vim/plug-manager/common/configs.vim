" Shahzad's All Common Plugin Configurations.

" C++ syntax highlight configurations.
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:c_no_curly_error = 1

" GDB plugin configs.
" let g:ConqueTerm_Color = 2    " 1: strip color after 200 lines, 2: always with color

" Source and header files configurations for f-switch.
au! BufEnter *.cpp,*.cc,*.c let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './,./**'
au! BufEnter *.hpp,*.h let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = './,./**'

" GitGutter default configurations.
let g:gitgutter_enabled = 1         " Default 1.
let g:gitgutter_signs = 1           " Default 1.
let g:gitgutter_highlight_lines = 0 " Default 0.
let g:gitgutter_max_signs = 5000    " Default 500.

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" Tell vim where the default global settings are located.
let g:ycm_global_ycm_extra_conf = '~/.vim/extra/YouCompleteMe/.ycm_extra_conf.py'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NerdCommenter configurations.
" Enable trimming of trailing whitespace when uncommenting, for nerdcommenter.
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting/uncommenting empty lines (useful when commenting a region).
let g:NERDCommentEmptyLines = 1
" Align line-wise comment delimiters flush left instead of following code indentation.
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default.
let g:NERDSpaceDelims = 1

" Theme for airline.
let g:airline_theme='gruvbox'

" GruvBox theme configurations.
" Tells GruvBox to show comments in italics (this line should show in italics).
let g:gruvbox_italic=1

" Rainbow parenthesis configurations.
" Turn it on by default.
let g:rainbow_active = 1 " Default 0, enable with :RainbowToggle if not on.
