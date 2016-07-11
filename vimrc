set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ngn/vim-apl'
Plugin 'airblade/vim-gitgutter'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Tabs to spaces
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" guess tabs or spaces
au bufread * cal <sid>et()
fu! s:et()
  if &ro || &bin | retu | en
  let a = map(getline(1, 256), 'v:val[0]')
  let &l:et = count(a, ' ') >= count(a, "\t")
endf


" Show red bar at 80 characters and highlight everything after it.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=red
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:gitgutter_sign_added = '>>'
let g:gitgutter_sign_removed = '<<'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_highlight_lines = 1 " Do Highlight lines
let g:gitgutter_realtime = 1
let g:git_gutter_eager = 1
