" Shahzad's Vim Theme Configurations.

" Set vim built in color support for terminal.
set termguicolors

" Set 256 terminal colors.
set t_Co=256

" Disable 'Background Color Erase' to fix colors inside 256-color tmux and GNU screen.
if &term =~ '256color'
  set t_ut=
endif

set background=dark

" Use GruvBox
colorscheme gruvbox

" Some good ones: cobalt, monokai-soda, monokai, lyla, neuromancer, solarized.
