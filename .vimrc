call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set nocompatible

colorscheme base16-onedark

set number
set mouse=a
set clipboard+=unnamedplus
set termguicolors
syntax on
set cursorline
set ruler
set noerrorbells

set ttyfast
set lazyredraw
set splitbelow

set wildmenu
set wildmode=longest,list

cnoremap W!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
