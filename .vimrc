" vi IMproved
set nocompatible

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
