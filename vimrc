set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimoutliner/vimoutliner'
Plugin 'restore_view.vim'
Plugin 'habamax/vim-asciidoctor'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar'
Plugin 'preservim/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line
set wrap
set linebreak
set formatoptions=nt
set textwidth=80
set wrapmargin=0
set noautoindent
set nocindent
set nosmartindent
set indentexpr=
set backspace=indent,eol,start

let g:asciidoctor_folding = 1

autocmd FileType asciidoctor setlocal spell
autocmd FileType asciidoctor syntax on


let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

set colorcolumn=80
set hlsearch
nnoremap <Leader>w :w<CR>
set directory=~/.vim/swapfiles//

