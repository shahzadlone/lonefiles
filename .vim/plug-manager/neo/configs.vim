" Shahzad's NeoVim(nvim) Specific Plugin Configurations ONLY.

if has('nvim')

    " NeoTex config option, to prevent issues.
    let g:tex_flavor = 'latex'

    " This is a common plugin but this option is for neovim specifically.
    let g:vimtex_compiler_progname = 'nvr'

    " Leader for the neovim gdb plugin. Sets the keys to the following after leader key:
    "   r: GdbRefresh
    "   c: GdbContinue
    "   n: GdbNext
    "   i: GdbStep
    "   N: GdbFinish
    "   t: GdbUntil
    "   b: GdbToggleBreak
    "   a: GdbToggleBreakAll
    "   C: GdbClearBreak
    "   x: GdbDebugStop
    "   k: GdbFrameUp
    "   j: GdbFrameDown
    let g:neobugger_leader = ' '

    " If we are using the NyaoVim for GUI and WEB stuff (can only use if using NyaoVim).
    if exists('g:nyaovim_version')

    endif

endif
