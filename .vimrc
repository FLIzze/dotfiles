let mapleader = " "

syntax on

set path+=**
set wildignore+=*/node_modules/*,*/.git/*

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
map <silent> <leader>t :!ctags -R --exclude=node_modules --exclude=git .<CR>
map <leader>f :find 

map <silent> <leader>n :bn<CR>
map <silent> <leader>p :bp<CR>
map <silent> <leader>d :bd<CR>
map <silent> <leader>l :ls<CR>
map <leader>b :b 

map <leader>c :set autochdir<CR>

map <silent> <leader>cn :cnext<CR>
map <silent> <leader>cp :cprev<CR>
map <silent> <leader>co :copen<CR>

map <silent> <c-k> :wincmd k<CR>
map <silent> <c-j> :wincmd j<CR>
map <silent> <c-h> :wincmd h<CR>
map <silent> <c-l> :wincmd l<CR>
map <silent> <leader>o :only<CR>

map <silent> <leader>gs :Git<CR>
map <silent> <leader>gl :Git log --oneline<CR>
map <silent> <leader>gc :Git commit<CR>
map <silent> <leader>gp :Git push<CR>
map <silent> <leader>gd :Git diff<CR>
map <silent> <leader>gb :Git blame<CR>
map <silent> <leader>gm :Git merge<CR>
map <silent> <leader>gr :Git rebase<CR>
map <silent> <leader>ga :Git add .<CR>
map <silent> <leader>du :diffupdate <CR> 
map <silent> <leader>d[ :diffget //2<CR>
map <silent> <leader>d] :diffget //3<CR>

if executable('rg')
	set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --glob\ '!node_modules/**'\ --glob\ '!tags'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'   
Plug 'godlygeek/tabular'
Plug 'machakann/vim-swap'
Plug 'mattn/emmet-vim'

call plug#end()
