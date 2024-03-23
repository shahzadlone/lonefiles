" Shahzad's Vim Plugins that ONLY work for neovim (might break non-neo vim) or
"  plugins that we ONLY want to use if we are using neovim (otherwise keep them disabled).

if has('nvim')
    " ================================================ These require Lua configurations or mappings.

    " Dressing - Better UI input and selection.
    Plug 'stevearc/dressing.nvim'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
    Plug 'nvim-tree/nvim-web-devicons'

    " Setup LSP / language server
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
    Plug 'neovim/nvim-lspconfig'

    " Auto-completion & Snippets
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    " Pictogram icons
    Plug 'onsails/lspkind.nvim'

    " Add lsp lens
    Plug 'VidocqH/lsp-lens.nvim'

    " Dim inactive neovim windows.
    " Plug 'sunjon/shade.nvim'


    " =================================================== These can be configured through vimscript.
    " Plugin that makes working with LaTeX simple.
    Plug 'donRaphaco/neotex', { 'for': 'tex' }

    " Integrate GDB into neovim.
    Plug 'huawenyu/neogdb.vim'

    " Navigational tree, CHADTree (try it out, swapping for nerdtree).
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}


    " If we are using the NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

        Plug 'rhysd/nyaovim-popup-tooltip'

        Plug 'rhysd/nyaovim-mini-browser'

        Plug 'rhysd/nyaovim-markdown-preview'

        Plug 'rhysd/nyaovim-tree-view'

    endif


endif
