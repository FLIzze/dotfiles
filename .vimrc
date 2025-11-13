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

set laststatus=0

map <silent> <leader>e :Ex<CR>
map <leader>s :so %<CR>
map <silent> <leader>y :nohl<CR>
map <silent> <leader>t :!ctags -R --exclude=node_modules --exclude=git .<CR>
map <leader>f :find 

map <silent> <leader>bn :bn<CR>
map <silent> <leader>bp :bp<CR>
map <silent> <leader>bd :bd<CR>
map <leader>c :set autochdir<CR>

map <silent> <leader>cn :cnext<CR>
map <silent> <leader>cp :cprev<CR>
map <silent> <leader>co :copen<CR>

map <leader>ev :find ~/.vimrc<CR>

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --glob\ '!node_modules/**'\ --glob\ '!tags'
endif
