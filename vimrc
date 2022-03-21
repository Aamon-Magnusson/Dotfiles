"     ___
"    / _ \
"   / /_\ \ __ _ _ __ ___   ___  _ __
"   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
"   | | | | (_| | | | | | | (_) | | | |
"   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
"
"		GitHub: https://github.com/Aamon-Magnusson

let mapleader = " "

" sets
filetype plugin on
set nowrap
set path+=**
set wildmenu
set nocompatible
set binary
set noerrorbells
set tabstop=4
set autoindent
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>
set relativenumber
set nu

packadd! dracula
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" Netrw settings (WIP)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 20

" Open netrw to aid in splits
map <leader>h :Sex<CR>
map <leader>n :Vex<CR>

" Close all of vim even with splits open
map <leader>c :wqa<CR>
map <leader>x :qa!<CR>

" Auto compile suckless programs
autocmd BufWritePost config.h,config.def.h !sudo make install clean

" Auto center on insert mode
autocmd InsertEnter * norm zz

" Copy paste (Must be gvim)
vnoremap <leader>c "*y :let @+=@*<CR>
map <leader>v "+p

" Enable spell check
map <leader>s :set spell spelllang=en_ca<CR>
map <leader>f :set spell spelllang=fr_ca<CR>
map <leader>a :set nospell<CR>

" Set fold 
map <leader>i :set fdm=indent<CR>

" Open both quotes or brakets at once
inoremap " ""<left>
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap < <><left>

" Move around splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" jump to placehoder
map <leader>j /<+++><CR>da<i

" template keybindings
nnoremap ,html :-1read $HOME/.vim/Templates/template.html<CR>/<+++><CR>da<i
nnoremap ,c :-1read $HOME/.vim/Templates/template.c<CR>/<+++><CR>da<
nnoremap ,py :-1read $HOME/.vim/Templates/template.py<CR>/<+++><CR>da<
nnoremap ,sh :-1read $HOME/.vim/Templates/template.sh<CR>/<+++><CR>da<


" TODO
" Give myself notes for folds (Hard to remember keys)
