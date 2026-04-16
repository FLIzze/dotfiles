let mapleader = " "

set nocompatible
set path+=**
set wildignore+=*/node_modules/*,*/.git/*,*/tags/*,*/venv/*,*/__pycache__/*
set wildignore+=*.o,*.obj,*.bin,*.pyc

set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=4

set number relativenumber
set hlsearch incsearch
set autoindent smartindent
set noswapfile
set nowrap
set autoread

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

set laststatus=1

map <silent> <leader>e :Ex<CR>
map <leader>s :so %<CR>
map <silent> <leader>u :nohl<CR>
map <silent> <leader>t :!ctags -R --exclude=node_modules --exclude=.git --exclude=.next .<CR>
map <leader>f :find 

map <silent> <leader>bn :bn<CR>
map <silent> <leader>bp :bp<CR>
map <silent> <leader>bd :bd<CR>
map <silent> <leader>bl :ls<CR>
map <leader>bb :b 

map <leader>c :set autochdir<CR>

map <silent> <leader>cn :cnext<CR>
map <silent> <leader>cp :cprev<CR>
map <silent> <leader>co :copen<CR>

map <silent> <c-k> :wincmd k<CR>
map <silent> <c-j> :wincmd j<CR>
map <silent> <c-h> :wincmd h<CR>
map <silent> <c-l> :wincmd l<CR>
map <silent> <leader>o :only<CR>

map <leader>y "+y
xnoremap <leader>p "_dP

if executable('rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --glob\ '!node_modules/**'\ --glob\ '!tags'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'   

call plug#end()
