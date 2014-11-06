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
Bundle 'scrooloose/nerdcommenter'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'msanders/snipmate.vim'
"Bundle 'drmingdrmer/xptemplate'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'derekwyatt/vim-protodef'

" Github repos of the user 'vim-scripts'
" => can omit the username part

" non github repos

filetype plugin indent on     " required!
filetype plugin on


set hlsearch
set autoindent

if has('gui_running')
	colorscheme blue
	set nu
else
	set t_Co=256
	syntax on
endif

set cindent
set foldmethod=syntax
set guifont=FixedSC\ 10
autocmd FileType cpp setlocal noexpandtab shiftwidth=4 softtabstop=0 tabstop=4 copyindent preserveindent
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nmap <F4> :FSHere<cr>
let mapleader = ","

"let g:xptemplate_key = '<C-j>'
"let g:xptemplate_key_force_pum = '<C-r><C-j>'
"let g:xptemplate_vars = "BRfun= "
