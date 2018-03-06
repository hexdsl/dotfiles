"  TODO confirm these
" [mode]remap : interpret key sequence
" [mode]reremap: reremap existing key binding
" [mode]nremap: do not interpret key sequence

let mapleader=","


" file actions
" ----------------------------
nmap <leader>w :w!<cr>
nmap <leader>wa :wa!<cr>
nmap <leader>x :x!<cr>
nmap <leader>xa :xa!<cr>
nmap <leader>q :q!<cr>
nmap <leader>qa :qa!<cr>

" editor interface
" ----------------------------

" NOTE disabled to allow vim-tmux-navigator
" " splits
" " pro tip: <c-w>[h|v] creates split directly
" nmap <c-j> <c-w>j
" nmap <c-k> <c-w>k
" nmap <c-l> <c-w>l
" nmap <c-h> <c-w>h

" tabs
nmap <s-t> :tabnew<cr>
nmap <s-q> :tabclose<cr>
nmap <s-h> gT
nmap <s-l> gt

" toggle spell check
nmap <silent> <leader>sp :set spell!<CR>

" word Count
nmap <leader>wc g<C-g>

" clear the search highlight
nmap <silent> \ :silent nohlsearch<cr>

" toggle invisibles
nmap <leader>i :set list!<cr>

" toggle Nerd Tree
nmap <leader>n :NERDTreeToggle<CR>
nmap <c-n> :NERDTreeToggle<CR>

" invoke CtrlP
" ff is mnemonic for Fuzzy Finder.
nmap <leader>ff :CtrlP<cr>
nmap <leader>ft :CtrlPTag<cradding < >
nmap <leader>fb :CtrlPBuffer<cr>

" toggle Goyo
nmap <leader>go :Goyo<CR>

" editor
" ----------------------------

" visual block with leader
nmap <leader>vb <C-V>

" move lines
nmap <silent> <s-j> :m +1<cr>
nmap <silent> <s-k> :m -2<cr>

" toggle letter casing
" pro tip: inverting case of character with ~
nmap <leader>u guu
nmap <leader>U gUU

" quick jump to last modification point or start of line
nmap <leader>` `.
nmap <leader>' '.

" visual wrappings
vmap <leader>* "zdi *<C-R>z*<Esc>
vmap <leader>** "zdi **<C-R>z**<Esc>
vmap <leader>[ "zdi [<C-R>z]<Esc>
vmap <leader>( "zdi (<C-R>z)<Esc>
vmap <leader>{ "zdi {<C-R>z}<Esc>
vmap <leader>` "zdi `<C-R>z`<Esc>
vmap <leader>< "zdi <<C-R>z><Esc>
