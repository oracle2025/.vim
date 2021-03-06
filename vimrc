set shell=/bin/sh
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
"Bundle 'Valloric/YouCompleteMe'
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
Bundle 'nvie/vim-flake8'
Bundle 'klen/python-mode'
Bundle 'reedes/vim-pencil'
Bundle 'junegunn/goyo.vim'
Bundle 'NickLaMuro/vimux'
Bundle 'terryma/vim-expand-region'
Bundle 'christoomey/vim-tmux-navigator'
" Bundle 'scrooloose/syntastic'
Bundle 'fatih/vim-go'
Bundle 'godlygeek/tabular'
Bundle 'freitass/todo.txt-vim'
Bundle 'jpalardy/vim-slime'
"Bundle 'vim-pandoc/vim-pandoc'
"Bundle 'vim-pandoc/vim-pandoc-syntax'

" Github repos of the user 'vim-scripts'
" => can omit the username part
"Bundle 'webBrowser'
Bundle 'DoxygenToolkit.vim'
Bundle 'utl.vim'
Bundle 'gitignore'
Bundle 'Mark--Karkat'

" non github repos

call vundle#end()
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
	let g:airline#extensions#tmuxline#enabled = 0
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
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

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
let g:org_todo_setup='TODO | DONE'
let g:org_capture_file = '~/GTD/journal.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

let g:org_agenda_select_dirs=["~/GTD"]
let g:org_agenda_files = split(glob("~/GTD/*.org"),"\n")


let g:org_command_for_emacsclient = 'emacsclient'
au BufRead,BufNewFile *py,*pyw set tabstop=8
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw set textwidth=79

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"let g:word_count="<unknown>"
"fun! WordCount()
    "return g:word_count
"endfun
"fun! UpdateWordCount()
    "let s = system("wc -w ".expand("%p"))
    "let parts = split(s, ' ')
    "if len(parts) > 1
        "let g:word_count = parts[0]
    "endif
"endfun

"augroup WordCounter
    "au! CursorHold * call UpdateWordCount()
    "au! CursorHoldI * call UpdateWordCount()
"augroup END

" how eager are you? (default is 4000 ms)
set updatetime=500
set directory=~/.vim/swapfiles//

let g:airline_section_x = '%{PencilMode()}'
"let g:airline_section_y = '%{WordCount()} words'
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard'})
augroup END

nmap <F5> :call VimuxRunCommand("make")<cr>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <CR> G
nnoremap <BS> gg
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set guioptions-=T

nnoremap <Leader>f :pyf /usr/local/share/clang-format.py<cr>
vnoremap <Leader>f <c-o>:pyf /usr/local/share/clang-format.py<cr>
highlight NonText ctermfg=15

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:slime_target = "tmux"

" let g:pandoc#modules#disabled = ["formatting"]
"let g:pandoc#formatting#mode = "ha"
"let g:pandoc#formatting#textwidth = 80
hi SpellBad ctermfg=001
"set formatoptions-=n

" When loading a file, if it reads in as Unix, but has a DOS line ending,
" and is not in binary mode, reload it in DOS format. Do this AFTER loading
" last known position to prevent always opening on last line.
"
" Time out the search after 1/10 second. Timeouts only available in 7.1.211
" and up, so just risk long loads in earlier versions.
if (v:version > 701 || v:version == 701 && has("patch211"))
  autocmd BufReadPost * nested
        \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc', 0, 100)) |
        \   let b:reload_dos = 1 |
        \   redir => s:num_dos_ends |
        \   silent %s#\r$##n |
        \   redir END |
        \   e ++ff=dos |
        \   echomsg "File has ".
        \     substitute(s:num_dos_ends, '^\_.\{-}\(\d\+\).*', '\1', '').
        \     " DOS-style line endings out of ".line('$')." lines." |
        \ endif
else
  autocmd BufReadPost * nested
        \ if !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc')) |
        \   let b:reload_dos = 1 |
        \   e ++ff=dos |
        \ endif
endif
autocmd BufReadPost * if exists('b:reload_dos') | unlet b:reload_dos | endif

