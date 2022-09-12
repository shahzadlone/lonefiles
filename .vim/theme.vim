" Shahzad's Vim Theme Configurations.

"================================================================================================ Before Setting Theme.

" Set 256 terminal colors.
set t_Co=256

" Disable 'Background Color Erase'.
if &term =~ '256color'
    set t_ut=
elseif (&term =~ '^xterm' && &t_Co == 256)
    set t_ut= | set ttyscroll=1
endif

if has('nvim')
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
elseif !has('nvim')
    " For normal vim set t_8f and t_8b.
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

if has('termguicolors')
  " Get GUI Colors (vim's built-in color support for terminal).
   set termguicolors
endif

" Type of Background.
set background=dark

"======================================================================================== Setting Theme / Colorscheme.
"---------------------------------------------------------- Theme OneDark configurations.
" Enable italics.
let g:onedark_terminal_italics = 1

" OneDark Airline theme.
let g:airline_theme='onedark'

" OneDark terminal colors.
" let g:onedark_termcolors=256

colorscheme onedark

"------------------------------------------------------------- Theme Nord configurations.
" colorscheme nord

" Following was set for nord to work previously.
" - " Set 256 terminal colors.
" - set t_Co=256
"
" - " Disable 'Background Color Erase'.
" - if &term =~ '256color'
" -     set t_ut=
" - elseif (&term =~ '^xterm' && &t_Co == 256)
" -     set t_ut= | set ttyscroll=1
" - endif
"
" - " Get Nice GUI Colors (vim's built-in color support for terminal).
" - if has('nvim') && has('termguicolors')
" -     set notermguicolors
"
" - " For normal vim set t_8f and t_8b.
" - elseif !has('nvim') && has('termguicolors')
" -     set t_8f=[38;2;%lu;%lu;%lum
" -     set t_8b=[48;2;%lu;%lu;%lum
" -     set notermguicolors
" - endif

"---------------------------------------------------------- Theme OneNord configurations.
" colorscheme onenord

"---------------------------------------------------------- Theme GruvBox configurations.
" colorscheme gruvbox

" Tells GruvBox to show comments in italics (this line should show in italics).
" let g:gruvbox_italic=1

" Gruvbox Airline.
" let g:airline_theme='gruvbox'

"================================================================================================ After Setting Theme.

"---------------------------------------------------------------- Airline Configurations.

" Tip can use `:AirlineExtension` command to see all loaded airline extentions.
" Additionally can do: `let g:airline_extensions = []` to turn them all off at once.

" Display only file name in statusline.
let g:airline_section_c_only_filename = 1

" Disable taglist and tagbar which give a verbose tags output I don't want to see.
let g:airline#extensions#taglist#enabled = 0
let g:airline#extensions#tagbar#enabled = 0

" Enable the list of buffers (tabline extention).
let g:airline#extensions#tabline#enabled = 1
" Hybrid tab names. Set to 'default' to show only file name (no path info) in the tabs.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Remove 'X' at the end of the tabline.
let g:airline#extensions#tabline#show_close_button = 0
" Can put text here like BUFFERS to denote buffers (I clear it so nothing is shown).
let g:airline#extensions#tabline#tabs_label = ''
" Can put text here like TABS to denote tabs (I clear it so nothing is shown).
let g:airline#extensions#tabline#buffers_label = ''
" Dont show buffers in the tabline.
let g:airline#extensions#tabline#show_buffers = 0
" Minimum of 1 tabs needed to display the tabline.
let g:airline#extensions#tabline#tab_min_count = 1
" Disables the buffer name that displays on the right of the tabline.
let g:airline#extensions#tabline#show_splits = 0
" Disable tab numbers.
let g:airline#extensions#tabline#show_tab_nr = 0
" Disables the weird ornage arrow on the tabline.
let g:airline#extensions#tabline#show_tab_type = 0
" Dont show tab numbers on the right.
let g:airline#extensions#tabline#show_tab_count = 0
" Show just the filename for the tabline.
" let g:airline#extensions#tabline#fnamemod = ':t'

" This makes airline show full path to file (without this only shows file name in statusline).
let g:airline_stl_path_style = 'full'

" g:airline_stl_path_style replaces the need to do the below hack, to show full path.
" let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" Make sure to have powerline fonts installed for this option to work.
" let g:airline_powerline_fonts = 1

" Turn mode showing off, to avoid showing double `INSERT` status when using Airline.
" Comment this if not using airline or powerline or some statusline.
set noshowmode

"---------------------------------------------------------------------------- Overwrites.
" Note: The following should come after the `colorscheme` has been set (to overide changes).
" Background highlighting colors I like: 24, 186, 237-242. For there english names look at:
" - https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim

" Tell vim about the escape codes for switching to italic mode.
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Make comments italicized.
highlight Comment cterm=italic gui=italic

" Set the color higlight of the static column for line character limit indication.
highlight ColorColumn ctermbg=blue guibg=blue

" Highlight and set color of the cursor's line.
" highlight CursorColumn term=bold cterm=bold gui=bold ctermbg=240 guibg=grey30 guifg=NONE ctermfg=NONE
highlight CursorColumn term=bold cterm=bold gui=bold ctermbg=236 guibg=#2C323C guifg=NONE ctermfg=NONE

" Highlight and set color of the cursor's line.
" highlight CursorLine term=bold cterm=bold gui=bold ctermbg=240 guibg=grey30 guifg=NONE ctermfg=NONE
highlight CursorColumn term=bold cterm=bold gui=bold ctermbg=236 guibg=#2C323C guifg=NONE ctermfg=NONE


" To be used with Coc.
"highlight CocSearch ctermfg=12 guifg=#18A3FF
"highlight CocMenuSel ctermbg=109 guibg=#13354A
