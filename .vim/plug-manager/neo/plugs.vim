" Shahzad's Vim Plugins that ONLY work for neovim (might break non-neo vim) or
"  plugins that we ONLY want to use if we are using neovim (otherwise keep them disabled).

if has('nvim')


    " If we are using the NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

        Plug 'rhysd/nyaovim-popup-tooltip'

        Plug 'rhysd/nyaovim-mini-browser'

        Plug 'rhysd/nyaovim-markdown-preview'

        Plug 'rhysd/nyaovim-tree-view'

    endif


    " =================================================== These can be configured through vimscript.
    " Plugin that makes working with LaTeX simple.
    Plug 'donRaphaco/neotex', { 'for': 'tex' }

    " Integrate GDB into neovim.
    Plug 'huawenyu/neogdb.vim'

    " Navigational tree, CHADTree (try it out, swapping for nerdtree).
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}


    " ================================================ These require Lua configurations or mappings.

    " Add lsp lens
    Plug 'VidocqH/lsp-lens.nvim'

    " Dim inactive neovim windows.
    " Plug 'sunjon/shade.nvim'

endif
