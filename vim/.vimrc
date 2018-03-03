" vimrc by Protesilaos Stavrou
" https://github.com/protesilaos/dotfiles
" last revised 2018-03-03

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

call SourceIfExists('~/.vim/vimrc_modules/general.vimrc')
call SourceIfExists('~/.vim/vimrc_modules/plugins.vimrc')
call SourceIfExists('~/.vim/vimrc_modules/protline.vimrc')
call SourceIfExists('~/.vim/vimrc_modules/keybindings.vimrc')
call SourceIfExists('~/.vim/vimrc_modules/helpers.vimrc')
call SourceIfExists('~/.vim/vimrc_modules/plugin_settings.vimrc')
call SourceIfExists('~/.vim/vimrc_modules/theme_settings.vimrc')
