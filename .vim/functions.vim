" Shahzad's Vim Functions

"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Functions to map command-mode commands. Use by call MapCommand(new, old)
"----------------------------------------------------------------------------------------
function! MapCommand(new, old)
    exec 'cnoreabbrev <expr> '.a:new
                \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:new.'")'
                \ .'? ("'.a:old.'") : ("'.a:new.'"))'
endfunction
"=======================================[End]============================================

"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Functions to make reverse latex search to pdf possible.
"----------------------------------------------------------------------------------------
"Load PDF to the page containing label
function! LoadEvinceByLabel(l)
    for f in split(glob("*.aux"))
        let label = system('grep "^.newlabel{' . a:l . '" ' . f)
        let page = matchstr(label, '.\{}{\zs.*\ze}}')
        if ! empty(page)
            call OpenPDF(substitute(f, "aux$", "pdf", ""), page)
            return
        endif
    endfor
endfunction

"Load PDF to the page containing the nearest previous label to the cursor
function! EvinceNearestLabel()
    let line = search("\\label{", "bnW")
    if line > 0
        let m = matchstr(getline(line), '\\label{\zs[^}]*\ze}')
        if empty(m)
            echomsg "No label between here and start of file"
        else
            call LoadEvinceByLabel(m)
        endif
    endif
endfunction
" nnoremap <buffer> <LocalLeader>Spdf :call EvinceNearestLabel()<CR>
command! SPDF call EvinceNearestLabel()
"=======================================[End]============================================

"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Function to help open a pdf file that has same non-extention name as the current file.
"----------------------------------------------------------------------------------------
"function! OpenFilesPdf()
"    silent !clear
"    let l:pdfFileName = expand("%:r") . ".pdf"
"    silent execute "!xpdf " . l:pdfFileName
"endfunction
"" So easier to open my current files corresponding pdf file.
"command! OpenPdf call OpenFilesPdf()
"=======================================[End]============================================

"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Function to help trim trailing whitespaces, which we can call by :Tws.
"----------------------------------------------------------------------------------------
function! TrimTrailingWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction
" So easier to call the trimming of white space function.
command! Tws call TrimTrailingWhitespace()
"=======================================[End]============================================


"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Open the url under the cursor in firefox.
"----------------------------------------------------------------------------------------
function! OpenUrlInBrowser()
    let line0 = getline (".")
    let line = matchstr (line0, "http[^ ]*")
    :if line==""
    let line = matchstr (line0, "ftp[^ ]*")
    :endif
    :if line==""
    let line = matchstr (line0, "file[^ ]*")
    :endif
    let line = escape (line, "#?&;|%")
    :if line==""
    let line = matchstr (line0, "www.[^ ]*")
    :endif
    exec ':silent !firefox ' . "\"" . line . "\""
endfunction
command! OpenUrl call OpenUrlInBrowser()
"=======================================[End]============================================


"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Function to help repeat a macro over all visually selected lines (see mappings.vim).
"----------------------------------------------------------------------------------------
function! VisualizeMacro()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction
"=======================================[End]============================================


"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Force update the vim plugs even if there are some local git changes.
"----------------------------------------------------------------------------------------
function! DiscardChangesPlugUpdate()
    let dirties = filter(copy(g:plugs),
                \ {_, v -> len(system(printf("cd %s && git diff --no-ext-diff --name-only", shellescape(v.dir))))})
    if len(dirties)
        call map(values(dirties),
                    \ {_, v -> system(printf("cd %s && git checkout -f", shellescape(v.dir)))})
        PlugUpdate --sync
        execute 'PlugInstall!' join(keys(dirties))
    else
        PlugUpdate
    endif
endfunction
command! ForcePlugUpdate call DiscardChangesPlugUpdate()
"=======================================[End]============================================


"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Function to help zoom and restore (toggle) a split like tmux. (see mappings.vim).
"----------------------------------------------------------------------------------------
function! s:ZoomAnySplit() abort
    if exists('t:zoomed') && t:zoomed
        execute t:reset_window
        let t:zoomed = 0
    else
        let t:reset_window = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! Zoom call s:ZoomAnySplit()
"=======================================[End]============================================


"======================================[Start]===========================================
"----------------------------------------------------------------------------------------
" Function helps watch your buffers if the opened file is modified externally.
"----------------------------------------------------------------------------------------
function! WatchForChanges(bufname, ...)
    " Figure out which options are in effect
    if a:bufname == '*'
        let id = 'WatchForChanges'.'AnyBuffer'
        let bufspec = ''
    else
        if bufnr(a:bufname) == -1
            echoerr "Buffer " . a:bufname . " doesn't exist"
            return
        end
        let id = 'WatchForChanges'.bufnr(a:bufname)
        let bufspec = a:bufname
    end
    if len(a:000) == 0
        let options = {}
    else
        if type(a:1) == type({})
            let options = a:1
        else
            echoerr "Argument must be a Dict"
        end
    end
    let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
    let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
    let disable     = has_key(options, 'disable')     ? options['disable']     : 0
    let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
    let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
    if while_in_this_buffer_only
        let event_bufspec = a:bufname
    else
        let event_bufspec = '*'
    end
    let reg_saved = @"
    let msg = "\n"
    redir @"
    silent! exec 'au '.id
    redir END
    let l:defined = (@" !~ 'E216: No such group or event:')
    if !l:defined
        if l:autoread
            let msg = msg . 'Autoread enabled - '
            if a:bufname == '*'
                set autoread
            else
                setlocal autoread
            end
        end
        silent! exec 'augroup '.id
        if a:bufname != '*'
            "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
            "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
            exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
        end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
        if more_events
            exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
            exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
        end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
end
" If they want to disable it, or it is defined and they want to toggle it,
if l:disable || (l:toggle && l:defined)
    if l:autoread
        let msg = msg . 'Autoread disabled - '
        if a:bufname == '*'
            set noautoread
        else
            setlocal noautoread
        end
    end
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
end
let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)

command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
"=======================================[End]============================================
