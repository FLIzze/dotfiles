let mapleader = " "

set nocompatible
syntax on
filetype on

set path+=**
set noswapfile
set number relativenumber
set clipboard=unnamedplus
set autoindent
set tabstop=8
set shiftwidth=8
set expandtab
set hlsearch incsearch
set showmatch
set ignorecase smartcase

colorscheme morning

nnoremap <leader>e :Explore<CR>
nnoremap <C-y> :noh<CR>
nnoremap <leader>y "+y
