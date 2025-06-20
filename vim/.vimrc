let mapleader = " "

syntax on
filetype on

" Sets

set nocompatible
set path+=**
set noswapfile
set number relativenumber
set tabstop=8
set shiftwidth=8
set clipboard=unnamedplus
set ignorecase smartcase
set autoindent
set scrolloff=5

" Remaps

nnoremap <leader>e :Explore<CR>
nnoremap <leader>s :so %<CR>
nnoremap <C-y> :noh<CR>
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Snippets

let templates = "~/Documents/dotfiles/vim/templates/"
nnoremap ,div :execute ':-1read' . templates . '/div'<CR>ji<TAB>
nnoremap ,p :execute '-1read' .  templates . '/p'<CR>f>a
nnoremap ,log :execute '-1read' .  templates . '/log'<CR>f(a
nnoremap ,err :execute '-2read' .  templates . '/err'<CR>ji<TAB>

" Plugins

" Auto-download Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()
