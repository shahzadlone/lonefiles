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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"============================================================= Theme Nord configurations.
colorscheme nord

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

" Some good themes: cobalt, monokai-soda, monokai, lyla, neuromancer, solarized.
