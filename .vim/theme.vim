" Shahzad's Vim Theme Configurations.

" Set 256 terminal colors.
 set t_Co=256

" Disable 'Background Color Erase'.
if &term =~ '256color'
    set t_ut=
endif

" Get Nice GUI Colors (vim's built-in color support for terminal).
set termguicolors


" Type of Background.
set background=dark
" let g:gruvbox_contrast_dark = 'hard'
" highlight Normal ctermbg=black ctermfg=white


"================================================================ Airline Configurations.
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"========================================================== Theme GruvBox configurations.
colorscheme gruvbox

" Tells GruvBox to show comments in italics (this line should show in italics).
let g:gruvbox_italic=1

" Gruvbox Airline.
let g:airline_theme='gruvbox'

"======================================================== Theme Solarized configurations.
" colorscheme NeoSolarized

" Tells NeoSolarized to use 256 colors.
" let g:solarized_termcolors=256

" Solarized Airline.
"let g:airline_theme='NeoSolarized'

"=================================================================== Other Tweaks Needed.
set t_ZH="\e[3m"
set t_ZR="\e[23m"

" Some good themes: cobalt, monokai-soda, monokai, lyla, neuromancer, solarized.
