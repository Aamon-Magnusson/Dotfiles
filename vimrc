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

autocmd BufWritePost config.h,config.def.h !sudo make install clean
