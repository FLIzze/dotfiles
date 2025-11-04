let mapleader = " "

syntax on

set path+=**

set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=4

set number relativenumber
set hlsearch incsearch
set autoindent smartindent
set noswapfile
set nowrap

map <silent> <leader>e :Ex<CR>
map <leader>s :so %<CR>
map <silent> <leader>y :nohl<CR>
map <silent> <leader>t :!ctags -R --exclude=node_modules --exclude=git .<CR>

map <silent> <leader>n :bn<CR>
map <silent> <leader>b :bp<CR>

map <leader>c :set autochdir<CR>
