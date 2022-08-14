" =========== "
" sets
" =========== "

let mapleader = " "

filetype plugin on
set nowrap
set path+=**
set wildmenu
set complete+=kspell
set completeopt=menuone,noselect
set nocompatible
set binary
set noerrorbells
set tabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set incsearch
set hlsearch
set relativenumber
set nu
set lazyredraw
set showmode
set showmatch
set noswapfile
set nobackup
set hidden

" Make splits go to "slave side"
set splitbelow
set splitright

" Might be too distracting, but I'll try it out
set cursorline
set cursorcolumn

" Mouse support (Hopefully I won't use it much)
set mouse=a

" markdown code blocks
let g:markdown_fenced_languages = ['java', 'bash', 'python', 'c']
let java_ignore_javadoc=1
