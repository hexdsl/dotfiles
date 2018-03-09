" protline: my simplistic statusline
" 
" based off of sources:
" https://www.reddit.com/r/vim/comments/6b7b08/my_custom_statusline/
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
"
" date function source:
" https://cromwell-intl.com/open-source/vim-word-count.html

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={
    \ 'n'  : 'Normal ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'Visual ',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'Insert ',
    \ 'R'  : 'Replace ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '}

function! ProtLineCurrentMode() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! ProtLinePasteMode()
    let paste_status = &paste
    if paste_status == 1
        return "paste"
    else
        return ""
    endif
endfunction

let g:word_count=""
function WordCount()
    return g:word_count
endfunction
function UpdateWordCount()
    let lnum = 1
    let n = 0
    while lnum <= line('$')
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

function! ProtLineActiveStatus()
    let statusline=""
    let statusline.="%#StatusLine#"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ ':'\ '}%)"
    let statusline.="%#CursorLineNr#"
    let statusline.="\ %{ProtLineCurrentMode()}\%-6{ProtLinePasteMode()}"
    let statusline.="%#Todo#"
    let statusline.="%{fugitive#head()!=''?'\  \'.fugitive#head().'\':'\'}"
    let statusline.="\ %<"
    let statusline.="%#Normal#"
    let statusline.="\ %F"
    let statusline.="\ %r"
    let statusline.="%=" 
    let statusline.="%#DiffChange#"
    let statusline.="\ %y "
    let statusline.="%#CursorLineNr#"
    let statusline.="\ %{WordCount()} "
    let statusline.="%#StatusLine#"
    let statusline.="\ %3l:%L:%c\ "
    return statusline
endfunction

function! ProtLineActiveStatusInsertMode()
    let statusline=""
    let statusline.="%#DiffAdd#"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ ':'\ '}%)"
    let statusline.="%#StatusLineTerm#"
    let statusline.="\ %{ProtLineCurrentMode()}\%-6{ProtLinePasteMode()}"
    let statusline.="%#Modemsg#"
    let statusline.="%{fugitive#head()!=''?'\  \'.fugitive#head().'\':'\'}"
    let statusline.="\ %<"
    let statusline.="%#Statement#"
    let statusline.="\ %F"
    let statusline.="\ %r"
    let statusline.="%=" 
    let statusline.="%#Modemsg#"
    let statusline.="\ %y "
    let statusline.="%#StatusLineTerm#"
    let statusline.="\ %{WordCount()} "
    let statusline.="%#DiffAdd#"
    let statusline.="\ %3l:%L:%c\ "
    return statusline
endfunction

function! ProtLineInactiveStatus()
    let statusline=""
    let statusline.="%#Todo#"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ ':'\ '}%)"
    let statusline.="%#StatusLineNC#"
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
    let statusline.="\ %<"
    let statusline.="%#Normal#"
    let statusline.="%f"
    let statusline.="\ %r"
    let statusline.="%=" 
    let statusline.="%#StatusLineNC#"
    let statusline.="\ %3l:%L\ "
    return statusline
endfunction

set laststatus=2
set noshowmode
set statusline=%!ProtLineActiveStatus()

augroup status
    autocmd!
    autocmd WinEnter * setlocal statusline=%!ProtLineActiveStatus()
    autocmd WinLeave * setlocal statusline=%!ProtLineInactiveStatus()
    autocmd InsertEnter * setlocal statusline=%!ProtLineActiveStatusInsertMode()
    autocmd InsertLeave * setlocal statusline=%!ProtLineActiveStatus()
augroup END
