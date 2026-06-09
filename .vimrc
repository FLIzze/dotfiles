let mapleader = " "

syntax on

set nocompatible
set wildignore+=*/node_modules/*,*/.git/*,*/tags/*,*/venv/*,*/__pycache__/*
set path=.,**

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

noremap <silent> <leader>e :Ex<CR>
noremap <leader>s :so %<CR>
noremap <silent> <leader>u :nohl<CR>
noremap <silent> <leader>t :!ctags -R --exclude=node_modules --exclude=.git --exclude=.next .<CR>

noremap <silent> <leader>bn :bn<CR>
noremap <silent> <leader>bp :bp<CR>
noremap <silent> <leader>bd :bd<CR>
noremap <silent> <leader>bl :ls<CR>
noremap <leader>bb :b

noremap <leader>c :set autochdir<CR>

noremap <silent> <leader>cn :cnext<CR>
noremap <silent> <leader>cp :cprev<CR>
noremap <silent> <leader>co :copen<CR>

noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>
noremap <silent> <leader>o :only<CR>

noremap <leader>y "+y
xnoremap <leader>p "_dP

if executable('rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --glob\ '!node_modules/**'\ --glob\ '!tags'
endif

call plug#begin()

Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fa :Files ~/Documents/<CR>

nnoremap <leader>gf :Rg 

nnoremap <C-g> :G<CR>
