let mapleader = " "

syntax on
filetype on

" Sets

set nocompatible
set path+=**
set noswapfile
set number relativenumber
set shiftwidth=8 tabstop=8 expandtab softtabstop=8 smarttab
set clipboard=unnamedplus
set ignorecase smartcase wildignorecase
set smartindent
set scrolloff=8
set signcolumn=number

" Snippets

let templates = "~/Documents/dotfiles/vim/templates/"
nnoremap ,html :execute '-1read' .  templates . '/html'<CR>4jf>a

" Remaps

nnoremap <leader>e :Explore<CR>
nnoremap <leader>s :so %<CR>
nnoremap <C-y> :noh<CR>
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>c :set autochdir<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Coc remaps

nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
nmap <leader>gf  <Plug>(coc-fix-current)
nmap <leader>gc  <Plug>(coc-codeaction-cursor)
nmap <leader>gn <Plug>(coc-rename)
nmap <silent> <leader>ge <Plug>(coc-codeaction-refactor)
nnoremap <silent><nowait> <space>ga  :<C-u>CocList diagnostics<cr>
nnoremap <leader>gf :call CocAction('format')<CR>
nnoremap <leader>go :CocList outline<CR>
nnoremap <leader>gw :CocList -I symbols<CR>

nnoremap <silent> K :call ShowDocumentation()<CR>
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#confirm() : "\<C-k>"

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Auto-download Plug

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()
