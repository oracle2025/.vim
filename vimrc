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
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
"Bundle 'drmingdrmer/xptemplate'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'derekwyatt/vim-protodef'
Bundle 'tikhomirov/vim-glsl'
Bundle 'Z1MM32M4N/vim-superman'
Bundle 'edkolev/tmuxline.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'hsitz/VimOrganizer'
Bundle 'mattn/calendar-vim'
Bundle 'chrisbra/NrrwRgn'

" Github repos of the user 'vim-scripts'
" => can omit the username part
"Bundle 'webBrowser'
Bundle 'DoxygenToolkit.vim'
Bundle 'utl.vim'

" non github repos

let g:ft_ignore_pat = '\.org'
filetype plugin indent on     " required!
filetype plugin on


set hlsearch
set autoindent

set laststatus=2
let g:airline_powerline_fonts = 1
if has('gui_running')
	colorscheme blue
	let g:airline_theme='simple'
	set nu
else
	set t_Co=256
	syntax on
endif

set cindent
set foldmethod=syntax
"set guifont=FixedSC\ 10
set guifont=Ttyp0\ 10
autocmd FileType cpp setlocal noexpandtab shiftwidth=4 softtabstop=0 tabstop=4 copyindent preserveindent
"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nmap <F4> :FSHere<cr>
let mapleader = ","

imap SS <esc>a<Plug>snipMateNextOrTrigger
smap SS <Plug>snipMateNextOrTrigger

"let g:xptemplate_key = '<C-j>'
"let g:xptemplate_key_force_pum = '<C-r><C-j>'
"let g:xptemplate_vars = "BRfun= "
if has("mac")
	let g:protodefctagsexe = '/usr/local/bin/ctags'
	set guifont=Menlo\ for\ Powerline:h11
	let g:airline_powerline_fonts = 1
endif

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

let g:org_tags_alist='{@HOME(h) @TIROL(t)} {COMPUTER(c) PROJECT(p) READING(r)}'
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

let g:org_agenda_select_dirs=["~/GTD"]
let g:org_agenda_files = split(glob("~/GTD/org-mod*.org"),"\n")


let g:org_command_for_emacsclient = 'emacsclient'

