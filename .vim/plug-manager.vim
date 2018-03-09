" Shahzad's Vim Plugins Managed by vim-plug

" ====================================[ Info ]===========================================
"
"        To install plugins run the command...                       :PlugInstall
"        To update plugins run the command...                        :PlugUpdate
"        To review the changes from last update use...               :PlugDiff
"        To remove/delete(clean) the undeclared plugins type...      :PlugClean
"
"        Also Use 'vim +PlugInstall +qall' to install plugins just from terminal.
" =======================================================================================

" Makes sure the plug.vim file is in the autoload folder, if not then goes and gets it.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins to get downloaded in.
call plug#begin('~/.vim/plug')
" ===============================[ Start of all Plugins ]================================

" Helps rename the current file by just :Rename <new-filename>.
Plug 'vim-scripts/Rename'

" Helps merge tabs, into splits.
Plug 'vim-scripts/Tabmerge'

" Adds the vim surrounding feature, to surround things using s.
Plug 'tpope/vim-surround'

" Enables repeating the surround command with the dot(.).
Plug 'tpope/vim-repeat'

" Nerd Tree for easier files, directory navigation.
Plug 'scrooloose/nerdtree'

" For easier commenting using <Leader> and 'c' command with combinations.
Plug 'scrooloose/nerdcommenter'

" To get rainbow nested parenthesis.
Plug 'luochen1990/rainbow'

" To help make the interaction with tmux seemless.
Plug 'benmills/vimux'

" To get the Table Mode.
Plug 'dhruvasagar/vim-table-mode'

" Advance C++ syntax and type highlighting.
Plug 'octol/vim-cpp-enhanced-highlight'

" Git gutter to show modified lines in file.
Plug 'airblade/vim-gitgutter'

" Status bar.
Plug 'vim-airline/vim-airline'

" Status bar themes.
Plug 'vim-airline/vim-airline-themes'

" Super tab to make compatible YCM and UltiSnip with tab.
Plug 'ervandew/supertab'

" Auto completing suggestions.
Plug 'Valloric/YouCompleteMe'

" To get quick snippets.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Install the gruvbox theme.
Plug 'morhetz/gruvbox'

" ================================[ End of all Plugins ]=================================
call plug#end()

" C++ syntax highlight configurations.
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:c_no_curly_error = 1

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
" Some specific file type coloring and start and ends.
let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/</ end=/>/ fold', 'start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'vim': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \		},
            \		'xml': {
            \			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'xhtml': {
            \			'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'php': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold', 'start=/(/ end=/)/ containedin=@htmlPreproc contains=@phpClTop', 'start=/\[/ end=/\]/ containedin=@htmlPreproc contains=@phpClTop', 'start=/{/ end=/}/ containedin=@htmlPreproc contains=@phpClTop'],
            \		},
            \		'css': 0,
            \		'sh': {
            \			'parentheses': [['\(^\|\s\)\S*()\s*{\?\($\|\s\)','_^{_','}'], ['\(^\|\s\)if\($\|\s\)','_\(^\|\s\)\(then\|else\|elif\)\($\|\s\)_','\(^\|\s\)fi\($\|\s\)'], ['\(^\|\s\)for\($\|\s\)','_\(^\|\s\)\(do\|in\)\($\|\s\)_','\(^\|\s\)done\($\|\s\)'], ['\(^\|\s\)while\($\|\s\)','_\(^\|\s\)\(do\)\($\|\s\)_','\(^\|\s\)done\($\|\s\)'], ['\(^\|\s\)case\($\|\s\)','_\(^\|\s\)\(\S*)\|in\|;;\)\($\|\s\)_','\(^\|\s\)esac\($\|\s\)']],
            \		},
            \	}
            \}

