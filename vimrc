set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-vinegar'

" Github repos of the user 'vim-scripts'
" => can omit the username part

" non github repos

filetype plugin indent on     " required!


set hlsearch
set autoindent
colorscheme blue
set cindent
autocmd FileType cpp setlocal expandtab shiftwidth=4 softtabstop=4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

