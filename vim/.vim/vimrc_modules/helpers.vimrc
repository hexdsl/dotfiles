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
