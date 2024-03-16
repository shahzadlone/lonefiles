" Shahzad's All Common Plugin Configurations.


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

"============================================================================== VimRooter
" note: The Mappings are defined in `~/.vim/plug-manager/common/mappings.vim`

" Treat the `.git` folder as the project root.
let g:rooter_patterns = ['.git/']
" Use `cd` not `lcd` for rooter's automatically directory changes.
let g:rooter_cd_cmd = 'cd'
" Do not change directory if no project root is found (do nothing, default).
let g:rooter_change_directory_for_non_project_files = ''
" Run rooter automatically.
let g:rooter_manual_only = 0
" Do not resolve symbolic links.
let g:rooter_resolve_links = 0
" Do not be silent when directory change happens.
let g:rooter_silent_chdir = 0

"============================================================================= VimPrinter
let g:vim_printer_print_below_keybinding = '<Leader>ll'
let g:vim_printer_print_above_keybinding = '<Leader>lL'
let g:vim_printer_items = {
    \ 'go'         : 'fmt.Println("{$}      : ", {$})',
    \ 'javascript' : 'console.log("{$}      : ", {$})',
    \}

"========================================================================== VimPrintDebug
" note: The Mappings are defined in `~/.vim/plug-manager/common/mappings.vim`

let g:print_debug_default = '"+=+=+=+=+=+= {} +=+=+=+=+=+="'
let g:print_debug_templates = {
    \ 'go':         'fmt.Printf("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= {}\n")',
    \ 'python':     'print(f"+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= {}")',
    \ 'javascript': 'console.log(`+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= {}`);',
    \ 'c':          'printf("+=+=+=+=+=+=+=+=+=+=+=+=+=+=+= {}\n");',
    \}

"========================================================================== SplitJoin.vim
let g:splitjoin_split_mapping = '<Leader>gs'
let g:splitjoin_join_mapping  = '<Leader>gj'

"======================================================================== LspCxxHighlight
" vim-lsp-cxx-highlight's support for text properties.
let g:lsp_cxx_hl_use_text_props = 1

"============================================================================= FatihVimGo
let g:go_fmt_command = "goimports"
let g:go_decls_mode = "fzf"

let g:go_code_completion_enabled = 1
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_echo_command_info = 0
let g:go_mod_fmt_autosave = 0
let g:go_template_autocreate = 0

" Highlights to keep turned off.
let g:go_highlight_space_tab_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_variable_assignments = 0

" Highlights to keep.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1

"==================================================================================== Fzf
" note: The Mappings are defined in `~/.vim/plug-manager/common/mappings.vim`

" Add namespace for fzf.vim commands.
let g:fzf_command_prefix = 'Fzf'

"=============================================================================== Prettier
" note: The Mappings are defined in `~/.vim/plug-manager/common/mappings.vim`

" Disable auto formatting of files that have "@format" or "@prettier" tag.
let g:prettier#autoformat = 0

" Don't allow formatting for files without "@format" or "@prettier" tag.
let g:prettier#autoformat_require_pragma = 1

" Don't enable auto formatting even if a config file is found.
let g:prettier#autoformat_config_present = 0

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

"=================================================================================== GOYO
" " Source and header files configurations for f-switch.
" autocmd BufNewFile,BufRead *.vimp call SetVimPresentationMode()
" function SetVimPresentationMode()
" 
"   nnoremap <buffer> <Right> :n<CR>
"   nnoremap <buffer> <Left> :N<CR>
" 
"   autocmd BufWinEnter,BufRead,BufNewFile *.vimp set filetype=markdown
" 
"   if !exists('#goyo')
"       Goyo
"   endif
" 
" endfunction


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

" Go to next / previous git hunk.
nmap g] <Plug>(GitGutterNextHunk)
nmap g[ <Plug>(GitGutterPrevHunk)

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
" note: The Mappings are defined in `~/.vim/plug-manager/common/mappings.vim`

let g:rainbow#max_level = 25
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

" Activation based on file type.
augroup rainbow_parenthsis
    autocmd!
    autocmd FileType * RainbowParentheses
augroup END

" List of colors that you do not want. ANSI code or #RRGGBB
" let g:rainbow#blacklist = [233, 234]

" ========[ Configure Verbose Plugins (plugins with long configuration formats) ]========
" Configure all the common plugins according to my preference.
source ~/.vim/plug-manager/common/configs-verbose.vim


"========================================================================================
" Below are commented out old or other configs I might turn back on in future.
"========================================================================================

"=============================================================================== SuperTab
" let g:SuperTabDefaultCompletionType = '<C-n>'

"===================================================================== VimMarkDownPreview
" Set markdown preview server (to handle wsl case).
" let g:mkdp_browser = 'edge'

"============================================================================= IndentLine
"" To set the default plugin colour for indenting off.
"let g:indentLine_setColors = 1
"
"" Show each indent level by a distinct char.
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"================================================================================= Vimade
"let g:vimade = {
"    \ 'normalid': '',
"    \ 'normalncid': '',
"    \ 'basefg': '',
"    \ 'basebg': '',
"    \ 'fadelevel': 0.4,
"    \ 'colbufsize': 15,
"    \ 'rowbufsize': 15,
"    \ 'checkinterval': 100,
"    \ 'usecursorhold': 0,
"    \ 'detecttermcolors': 0,
"    \ 'enablescroll': 1,
"    \ 'signsid': 13100,
"    \ 'signsretentionperiod': 4000,
"    \ 'fademinimap': 1,
"    \ 'fadepriority': 10,
"    \ 'groupdiff': 1,
"    \ 'groupscrollbind': 0,
"    \ 'enablefocusfading': 0,
"    \ 'enablebasegroups': 1,
"    \ 'enabletreesitter' : 0,
"    \ 'basegroups': [
"        \'Folded',
"        \'Search',
"        \'SignColumn',
"        \'LineNr',
"        \'CursorLine',
"        \'CursorLineNr',
"        \'DiffAdd',
"        \'DiffChange',
"        \'DiffDelete',
"        \'DiffText',
"        \'FoldColumn',
"        \'Whitespace'
"    \]
"\}

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

