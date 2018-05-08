" Shahzad's Vim Plugins Managed by 'vim-plug'.

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

    silent !sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ${MYVIMRC}

endif


" Specify a directory for plugins to get downloaded in.
call plug#begin('~/.vim/plug-manager/plug') " =========[ Start Loading Plugins ]=========

" Load common plugins, that will always get loaded.
source ~/.vim/plug-manager/common/plugs.vim

if has('nvim')

    " Load neovim specific plugins only.
    source ~/.vim/plug-manager/neo/plugs.vim

else

    " Load vim specific plugins only (example: ones we don't want to run with neomake).
    source ~/.vim/plug-manager/normal/plugs.vim

endif

call plug#end() " =======================[ End Loading Plugins ]=========================


" ==============[ Configure Plugins (Select Options and Map Key Bindings) ]==============

" Configure all the common plugins according to my preference.
source ~/.vim/plug-manager/common/configs.vim
" Map all the common plugin specific key bindings according to my preference.
source ~/.vim/plug-manager/common/mappings.vim

if has('nvim')

    " Configure neovim specific (only) plugins, according to my preference.
    source ~/.vim/plug-manager/neo/configs.vim
    " Bind only neovim plugins specific key bindings, according to my preference.
    source ~/.vim/plug-manager/neo/mappings.vim

else

    " Configure normal vim specific (only) plugins according to my preference.
    source ~/.vim/plug-manager/normal/configs.vim
    " Bind only normal vim plugins specific key bindings, according to my preference.
    source ~/.vim/plug-manager/normal/mappings.vim

endif
