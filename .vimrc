" Plugins
" ------------------------------------------------
call plug#begin('~/.vim/plugged')

  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'dpelle/vim-LanguageTool'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ervandew/supertab'
  Plug 'protesilaos/prot16-vim'
  Plug 'protesilaos/tempus-themes-vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'qpkorr/vim-renamer'
  Plug 'junegunn/goyo.vim'

call plug#end()

" General
" ------------------------------------------------
set encoding=utf-8
set errorbells
set visualbell
set autoread

set updatetime=500
set undolevels=1000

set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set showcmd
set wildmenu

" Buffers
set hidden
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprev<CR>

" Lines
set number
set relativenumber
set cursorline
set wrap
set ruler

set modifiable

" Behaviour
set showmatch
set textwidth=0
set nostartofline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Tabs
set autoindent
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

" Searches
set hlsearch
set incsearch

" Splits
set wmw=0
set wmh=0
set splitbelow splitright

" Key bindings
" -----------------------------------------------
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

" Helpers
" ------------------------------------------------
" Paste mode avoids auto-indent
set pastetoggle=<leader>p

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Abbreviations
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab mesite https://protesilaos.com/
iab megithub https://github.com/protesilaos
iab megitlab https://gitlab.com/protesilaos
iab metwitter https://twitter.com/protstavrou

" Plugin settings
" ------------------------------------------------
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

" Theme
set t_Co=256
syntax enable
colorscheme tempus_winter
