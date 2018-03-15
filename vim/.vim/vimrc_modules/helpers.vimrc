" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Abbreviations
iab medate <c-r>=strftime('%Y-%m-%)<cr>
iab metime <c-r>=strftime('%H:%M')<cr>
iab meweb https://protesilaos.com/
iab megithub https://github.com/protesilaos
iab medots https://github.com/protesilaos/dotfiles
iab megitlab https://gitlab.com/protesilaos
iab metwitter https://twitter.com/protstavrou
