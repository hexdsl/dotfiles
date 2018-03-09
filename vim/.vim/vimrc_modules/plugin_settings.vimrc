" Nerd Commenter
filetype plugin indent on
let NERDSpaceDelims = 1

" Nerd Tree
let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Git status nerdtree
let NERDTreeMinimalUI=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "^",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "/",
    \ "Deleted"   : "D",
    \ "Dirty"     : "x",
    \ "Clean"     : "V",
    \ 'Ignored'   : '~',
    \ "Unknown"   : "?"
    \ }

" CtrlP
" Ignore common directories
let g:ctrlp_custom_ignore = {
   \ 'dir': 'node_modules\|bower_components\|public\|_site\|vendor',
   \ }

" Goyo
let g:goyo_width = 80
let g:goyo_height = '90%'

" tmux-navigator
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Vim markdown
let g:markdown_fenced_languages = ['html', 'css', 'scss', 'yaml', 'bash=sh']
