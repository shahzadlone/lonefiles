" Shahzad's Vim Theme Configurations.


" Set 256 terminal colors.
set t_Co=256

" Disable 'Background Color Erase'.
if &term =~ '256color'
    set t_ut=
elseif (&term =~ '^xterm' && &t_Co == 256)
    set t_ut= | set ttyscroll=1
endif

" Get Nice GUI Colors (vim's built-in color support for terminal).
if has('nvim') && has('termguicolors')
    set notermguicolors
" For normal vim set t_8f and t_8b.
elseif !has('nvim') && has('termguicolors')
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set notermguicolors
endif

" Type of Background.
set background=dark

"================================================================ Airline Configurations.
" Make sure to have powerline fonts installed for this option to work.
" let g:airline_powerline_fonts = 1

" Hybrid tab names. Set to 'default' to show only file name (no path info) in the tabs.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" This makes airline show full path to file (without this only shows file name in statusline).
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" Turn mode showing off to avoid showing double `INSERT` status when using Airline.
" Comment this if not using airline or powerline or some statusline.
set noshowmode


"============================================================= Theme Nord configurations.
colorscheme nord

"========================================================== Theme OneNord configurations.
" colorscheme onenord

"========================================================== Theme OneDark configurations.
"colorscheme onedark
"let g:onedark_config = {
"  \ 'style': 'deep',
"  \ 'toggle_style_key': '<leader>ts',
"  \ 'ending_tildes': v:true,
"  \ 'diagnostics': {
"    \ 'darker': v:false,
"    \ 'background': v:false,
"  \ },
"\ }

"========================================================== Theme GruvBox configurations.
" colorscheme gruvbox

" Tells GruvBox to show comments in italics (this line should show in italics).
" let g:gruvbox_itolic=1

" Gruvbox Airline.
" let g:airline_theme='gruvbox'

"======================================================== Theme Solarized configurations.


"=================================================================== Other Tweaks Needed.
set t_ZH="\e[3m"
set t_ZR="\e[23m"
