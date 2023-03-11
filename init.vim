if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
call plug#begin()
Plug 'base16-project/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
call plug#end()

let maplocalleader = " "
let mapleader = " "

set nocompatible

set number
set mouse=a
set clipboard=unnamedplus
set encoding=utf-8
set termguicolors
syntax on
set cursorline
colorscheme base16-grayscale-dark
set hidden
set incsearch
set hlsearch
set wrapscan
set backspace=indent,eol,start
set ruler

"tabs TABS
set tabstop=8

set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set ttyfast
set lazyredraw

set wildmenu
set wildmode=full
set splitbelow splitright

set backup
set undofile

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:airline_section_b = '%{strftime("%A %d/%m/%y %H:%M %Z")}'

filetype plugin indent on

" Allow saving of files as sudo when I forget to start vim using sudo.
cnoremap W!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"	Vimtex
let g:vimtex_fold_enabled = 0
let g:vimtex_indent_enabled = 1
let g:vimtex_complete_recursive_bib = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 1,
\}
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=2
let g:tex_conceal="abdgm"
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

"NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
