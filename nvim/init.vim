"     ___
"    / _ \
"   / /_\ \ __ _ _ __ ___   ___  _ __
"   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
"   | | | | (_| | | | | | | (_) | | | |
"   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
"
"		GitHub: https://github.com/Aamon-Magnusson

let mapleader = " "

" =========== "
" sets
" =========== "
filetype plugin on
set nowrap
set path+=**
set wildmenu
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

" Make splits go to "slave side"
set splitbelow
set splitright

" Might be too distracting, but I'll try it out
set cursorline
set cursorcolumn

" Mouse support (Hopefully I won't use it much)
set mouse=a

" =========== "
" Auto commands
" =========== "
" Auto compile suckless programs
autocmd BufWritePost config.h,config.def.h !sudo make install clean

" Auto command to clear trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" clean /r from file
"autocmd BufReadPost * :%s/\r//g
nmap <leader>r :%s/\r//g<CR> " I'm trying to make this an autocmd but not yet ready

" Auto center on insert mode
autocmd InsertEnter * norm zz

" Open netrw if no files are given
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" =========== "
" Keybindings
" =========== "
" Open netrw to aid in splits
map <leader>h :Sex<CR>
map <leader>n :Vex!<CR>

" Close all of vim even with splits open
map <leader>q :wqa<CR>
map <leader>Q :qa!<CR>

" Make Y work the same as other upercase chars
nmap Y y$

" Copy paste
vnoremap <leader>c "*y :let @+=@*<CR>
map <leader>v "+p

" Enable spell check
map <leader>se :set spell spelllang=en_ca<CR>
map <leader>sf :set spell spelllang=fr_ca<CR>
map <leader>so :set nospell<CR>

" Fix last spelling error
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>sl :call FixLastSpellingError()<cr>

" Move line to the top of a paragraph
function! MoveLineToTopOfList()
  normal! kmmjdd{p`m
endfunction
nnoremap <leader>l0 :call MoveLineToTopOfList()<cr>

" Move line to the bottom of a paragraph
function! MoveLineToBottomOfList()
  normal! kmmjdd}P`m
endfunction
nnoremap <leader>l9 :call MoveLineToBottomOfList()<cr>

" Set fold
map <leader>i :set fdm=indent<CR>
map <leader>I :set fdm=syntax<CR>

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

" resize splits
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" jump to placehoder
map <leader>p /<+++><CR>ca<

" template keybindings
nnoremap ,html :-1read $HOME/.config/nvim/Templates/template.html<CR>/<+++><CR>da<i
nnoremap ,c :-1read $HOME/.config/nvim/Templates/template.c<CR>/<+++><CR>da<
nnoremap ,py :-1read $HOME/.config/nvim/Templates/template.py<CR>/<+++><CR>da<
nnoremap ,sh :-1read $HOME/.config/nvim/Templates/template.sh<CR>/<+++><CR>da<

" Remove highlights from searches
nnoremap <CR> :nohlsearch<CR>

" Moving lines up or down in every mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv

" keep area selected when shifting
vnoremap < <gv
vnoremap > >gv

" Quickfix list
noremap <leader>cg :vimgrep //g **/*<CR>
vnoremap <leader>cg y:vimgrep /<C-r>"/g **/*<CR>
noremap <leader>cf :.cc<CR>
noremap <leader>co :copen<CR>
noremap <leader>cc :ccl<CR>
noremap <leader>cm :set modifiable<CR>
noremap <leader>cn :cnext<CR>zz
noremap <leader>cN :cprev<CR>zz

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>f :%s///g<Left><Left>
nnoremap <Leader>fc :%s///gc<Left><Left><Left>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" =========== "
" Themeing
" =========== "
" Dracula color scheme
packadd! dracula
syntax enable
colorscheme dracula
"hi Normal guibg=NONE ctermbg=NONE

" Netrw settings (WIP)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 20

" Status line
source ~/.config/nvim/statusLine.vim

" TODO
