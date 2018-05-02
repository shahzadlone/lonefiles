" Shahzad's Neo Vim Configurations(~/.config/nvim/init.vim) which bassically uses
"  my ~/.vimrc.
" Note: to find neovim specifc configurations look at ~/.vim/neovim.vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after

let &packpath = &runtimepath

source ~/.vimrc
