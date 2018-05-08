" Shahzad's NeoVim(nvim) Specific Plugin Configurations ONLY.

if has('nvim')

    " NeoTex config option, to prevent issues.
    let g:tex_flavor = 'latex'

    " This is a common plugin but this option is for neovim specifically.
    let g:vimtex_compiler_progname = 'nvr'

endif
