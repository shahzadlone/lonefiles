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

"=================================================================== Initialization Step.
" Makes sure the plug.vim file is in the autoload folder, if not then goes and gets it.
if empty(glob('~/.vim/autoload/plug.vim'))

    silent !sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ${MYVIMRC}

endif


" Specify a directory for plugins to get downloaded in.
call plug#begin('~/.vim/plug-manager/plug') " ==================== Start Loading Plugins.

" Load common plugins, that will always get loaded.
source ~/.vim/plug-manager/common/plugs.vim

" Load neovim specific plugins only.
source ~/.vim/plug-manager/neo/plugs.vim

" Load vim specific plugins only (example: ones we don't want to run with neomake).
source ~/.vim/plug-manager/normal/plugs.vim

call plug#end() " =============================================== End of Loading Plugins.


"====================================== Automatically Install Missing Plugins on Startup.
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


"============================================= Configure Plugins (Select Plug-In Options)

" Configure all the common plugins according to my preference.
source ~/.vim/plug-manager/common/configs.vim

" Configure neovim specific (only) plugins, according to my preference.
source ~/.vim/plug-manager/neo/configs.vim

" Configure normal vim specific (only) plugins according to my preference.
source ~/.vim/plug-manager/normal/configs.vim

" All my plugin specific mappings are sourced at the end of the ~/.vim/mappings.vim file.
