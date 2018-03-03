" protline: my simplistic statusline
" based off of sources:
" https://www.reddit.com/r/vim/comments/6b7b08/my_custom_statusline/
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2

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

function! ProtLineActiveStatus()
    let statusline=""
    let statusline.="%#StatusLine#"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
    let statusline.="%{ProtLineCurrentMode()}\%-6{ProtLinePasteMode()}\"
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
    let statusline.="\ %<"
    let statusline.="%F"
    let statusline.="\ %r"
    let statusline.="%=" 
    let statusline.="\ %y"
    let statusline.="\ \ "
    let statusline.="\%3l:%L:%c\ "
    return statusline
endfunction

function! ProtLineActiveStatusInsertMode()
    let statusline=""
    let statusline.="%#SpellLocal#"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
    let statusline.="%{ProtLineCurrentMode()}\%-6{ProtLinePasteMode()}\"
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
    let statusline.="\ %<"
    let statusline.="%F"
    let statusline.="\ %r"
    let statusline.="%=" 
    let statusline.="\ %y"
    let statusline.="\ \ "
    let statusline.="\%3l:%L:%c\ "
    return statusline
endfunction

function! ProtLineInactiveStatus()
    let statusline=""
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
    let statusline.="\ %<"
    let statusline.="%f"
    let statusline.="\ %r"
    let statusline.="%=" 
    let statusline.="\%3l:%L\ "
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

