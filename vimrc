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

syntax on

autocmd BufWritePost config.h,config.def.h !sudo make install clean

"set spell spelllang=en_ca
"set fdm=indent

"vnoremap <C-c> "*y :let @+=@*<CR>
"map <C-v> "+P
