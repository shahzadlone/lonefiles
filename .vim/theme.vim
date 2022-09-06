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

" Get Nice GUI Colors (vim's built-in color support for terminal).
set termguicolors

if has('nvim')
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
elseif !has('nvim')
    " For normal vim set t_8f and t_8b.
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
endif

" Type of Background.
set background=dark

"======================================================================================== Setting Theme / Colorscheme.
"---------------------------------------------------------- Theme OneDark configurations.
colorscheme onedark

" Enable italics.
let g:onedark_terminal_italics = 1

" OneDark Airline theme.
let g:airline_theme='onedark'
"------------------------------------------------------------- Theme Nord configurations.
" colorscheme nord

" Following was set for nord to work previously.
" - " Set 256 terminal colors.
" - set t_Co=256
" - 
" - " Disable 'Background Color Erase'.
" - if &term =~ '256color'
" -     set t_ut=
" - elseif (&term =~ '^xterm' && &t_Co == 256)
" -     set t_ut= | set ttyscroll=1
" - endif
" - 
" - " Get Nice GUI Colors (vim's built-in color support for terminal).
" - if has('nvim') && has('termguicolors')
" -     set notermguicolors

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
" Make sure to have powerline fonts installed for this option to work.
" let g:airline_powerline_fonts = 1

" Hybrid tab names. Set to 'default' to show only file name (no path info) in the tabs.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" This makes airline show full path to file (without this only shows file name in statusline).
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" Turn mode showing off to avoid showing double `INSERT` status when using Airline.
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
highlight CursorColumn term=bold cterm=bold gui=bold ctermbg=240 guibg=grey30 guifg=NONE ctermfg=NONE

" Highlight and set color of the cursor's line.
highlight CursorLine term=bold cterm=bold gui=bold ctermbg=240 guibg=grey30 guifg=NONE ctermfg=NONE

" To be used with Coc.
"highlight CocSearch ctermfg=12 guifg=#18A3FF
"highlight CocMenuSel ctermbg=109 guibg=#13354A
