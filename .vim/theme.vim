" Shahzad's Vim Theme Configurations.

" Set 256 terminal colors.
 set t_Co=256

" Disable 'Background Color Erase'.
if &term =~ '256color'
    set t_ut=
endif

set background=dark

" GruvBox theme configurations.
" Tells GruvBox to show comments in italics (this line should show in italics).
colorscheme gruvbox
let g:gruvbox_italic=1
set t_ZH="\e[3m"
set t_ZR="\e[23m"

" Gruvbox Airline..
let g:airline_theme='gruvbox'



" ============ Settings I needed back in the day when I used Ubuntu 12.04-18.04. ============
"" Set vim built in color support for terminal.
"set termguicolors
"
" Some good ones: cobalt, monokai-soda, monokai, lyla, neuromancer, solarized.
