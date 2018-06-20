" vi IMproved
set nocompatible

" plugin stuff
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'

call plug#end()

" sneak config
let g:sneak#label = 1
let g:sneak#streak = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S

" ale config
let g:ale_linters = {
\   'python': ['flake8'],
\   'R': ['lintr']
\}

" lightline config
let g:lightline = {
\ 'colorscheme': 'landscape',
\ }

if !has('gui_running')
  set t_Co=256
endif

" Backspace 
set backspace=indent,eol,start 

" sets up syntax highlighting
syntax enable

" sets line numbers
""" set relativenumber number
set number

" sets parenthetical highlighting to just bold
""" hi MatchParen cterm=bold ctermbg=Gray ctermfg=none

" sets tabs to 4 spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" makes indenting smart
set smartindent

" sets noexpandtab for Makefiles
if &ft == 'make'
    setlocal noexpandtab
    setlocal tabstop=4
endif

" search highlight
set hlsearch
set incsearch

" shortcut to unhighlight search results
nnoremap <silent> <C-l> : <C-u> nohlsearch <CR> <C-l>

" cursor return to last seen position when open file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" save on entering normal mode

" stuff for plugins
inoremap <Esc> <Esc>:w<CR>
