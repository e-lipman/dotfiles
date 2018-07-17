" vi IMproved
set nocompatible

" plugin stuff
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" for autocomplete
"Plug 'roxma/nvim-completion-manager'
"Plug 'jalvesaq/Nvim-R'
"Plug 'gaalcaras/ncm-R'

Plug 'luochen1990/rainbow'

Plug 'SirVer/ultisnips'

call plug#end()

" sneak config
let g:sneak#label = 1
let g:sneak#streak = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S

"" ale config
"let g:ale_linters = {
"\   'python': ['flake8'],
"\   'R': ['lintr']
"\}

" lightline config
let g:lightline = {
\ 'colorscheme': 'landscape',
\ }

if !has('gui_running')
  set t_Co=256
endif

" deoplete config
let g:deoplete#enable_at_startup = 1

" rainbow config
"let g:rainbow_active = 1

" ultisnips config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippits="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippitDirectories = ["UltiSnips"]

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

" filtype settings
filetype plugin on
filetype indent on

" sets noexpandtab for Makefiles
if &ft == 'make'
    setlocal noexpandtab
    setlocal tabstop=4
endif

" set filetypes for Rnw
if has("autocmd")
    autocmd BufRead,BufNewFile *.Rnw set ft=rnoweb
    autocmd BufRead,BufNewFile *.rnw set ft=rnoweb
endif

" spell check
set spelllang=en
nnoremap <C-s> : :set spell <CR>

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
inoremap <Esc> <Esc>:w<CR>

" newline without entering insert
nmap <C-O> O<esc>
nmap <CR> o<esc>
