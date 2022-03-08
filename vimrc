"     ___
"    / _ \
"   / /_\ \ __ _ _ __ ___   ___  _ __
"   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
"   | | | | (_| | | | | | | (_) | | | |
"   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
"
"		GitHub: https://github.com/Aamon-Magnusson

let mapleader = " "

filetype plugin on
"set nowrap
set path+=**
set wildmenu
set nocompatible
set binary
set noerrorbells
set tabstop=4
set autoindent
set incsearch
set relativenumber
set nu
set scrolloff=15

packadd! dracula
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" Netrw settings (WIP)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_browse_split = 4
"let g:netrw_winsize = 20

" Auto compile suckless programs
autocmd BufWritePost config.h,config.def.h !sudo make install clean

" Copy paste (Must be gvim)
vnoremap <leader>c "*y :let @+=@*<CR>
map <leader>v "+p

" Enable spell check
map <leader>s :set spell spelllang=en_ca<CR>
map <leader>a :set nospell<CR>
map <leader>f :set spell spelllang=fr_ca<CR>

" Set fold 
map <leader>i :set fdm=indent<CR>

" Open both quotes or brakets at once
inoremap " ""<left>
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap < <><left>
