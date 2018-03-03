let mapleader=","

" Unmap arrows - learn Vim!
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Visual block remap
nmap <leader>vb <C-V>
nmap <c-s-v> <C-V>

" File actions
nmap <leader>w :w!<cr>
nmap <leader>wa :wa!<cr>
nmap <leader>x :x!<cr>
nmap <leader>xa :xa!<cr>
nmap <leader>q :q!<cr>
nmap <leader>qa :qa!<cr>
nmap <c-s-w> :w!<cr>
nmap <c-s-q> :q!<cr>
nmap <c-s-x> :x!<cr>

" Remap escape for insert mode
inoremap jk <Esc>

" Navigate vsplits
nnoremap <c-s-j> <c-w><c-j>
nnoremap <c-s-k> <c-w><c-k>
nnoremap <c-s-l> <c-w><c-l>
nnoremap <c-s-h> <c-w><c-h>

" " Navigate and maximise splits
" nmap <silent> <leader>j <C-W>j<C-W>_
" nmap <silent> <leader>k <C-W>k<C-W>_
" nmap <silent> <c-s-j> <C-W>j<C-W>_
" nmap <silent> <c-s-k> <C-W>k<C-W>_

" Manage Vim tabs
nmap <s-t> :tabnew<cr>
nmap <s-q> :tabclose<cr>
nmap <s-h> gT
nmap <s-l> gt

" Move lines
noremap <silent> <s-j> :m +1<cr>
noremap <silent> <s-k> :m -2<cr>

" Clear the search highlight
nmap <silent> \ :silent nohlsearch<cr>

" Toggle letter casing
" Inverting case of character with ~
nmap <leader>u guu
nmap <leader>U gUU

" Quick jump to last modification point or start of line
nmap <leader>` `.
nmap <leader>' '.

" Toggle spell check
nmap <silent> <leader>sp :set spell!<CR>

" Word Count
nmap <leader>wc g<C-g>

" " Visually select the text that was last edited/pasted
" nmap <silent> <leader>v `[v`]

" Visual wrappings
:vmap <leader>* "zdi *<C-R>z*<Esc>
:vmap <leader>** "zdi **<C-R>z**<Esc>
:vmap <leader>[ "zdi [<C-R>z]<Esc>
:vmap <leader>( "zdi (<C-R>z)<Esc>
:vmap <leader>{ "zdi {<C-R>z}<Esc>
:vmap <leader>` "zdi `<C-R>z`<Esc>
:vmap <leader>< "zdi <<C-R>z><Esc>

" Toggle invisibles
nnoremap <leader>i :set list!<cr>

" Toggle Nerd Tree
map <leader>n :NERDTreeToggle<CR>
map <c-s-n> :NERDTreeToggle<CR>

" Invoke CtrlP
" ff is mnemonic for Fuzzy Finder.
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>ft :CtrlPTag<cradding < >
nnoremap <leader>fb :CtrlPBuffer<cr>

" Toggle Goyo
map <leader>go :Goyo<CR>

