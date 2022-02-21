"     ___
"    / _ \
"   / /_\ \ __ _ _ __ ___   ___  _ __
"   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
"   | | | | (_| | | | | | | (_) | | | |
"   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
"
"		GitHub: https://github.com/Aamon-Magnusson

set binary
set noerrorbells
set tabstop=4
set nowrap
set autoindent
set incsearch
set relativenumber
set nu
set scrolloff=8
set syntax=python

packadd! dracula
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

autocmd BufWritePost config.h,config.def.h !sudo make install clean

" Copy paste (Must be gvim)
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

" Enable spell check
map <C-s> :set spell spelllang=en_ca<CR>
map <C-a> :set nospell<CR>

" Set fold 
map <C-i> :set fdm=indent<CR>
