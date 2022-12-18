"     ___
"    / _ \
"   / /_\ \ __ _ _ __ ___   ___  _ __
"   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
"   | | | | (_| | | | | | | (_) | | | |
"   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
"
"		Website: aamon.xyz

let mapleader = " "

" sets
filetype plugin on
set mouse=a
set nowrap
set path+=**
set wildmenu
set nocompatible
set binary
set hidden
set noswapfile
set nobackup
set noerrorbells
set tabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR>
set relativenumber
set nu
set lazyredraw
set showmode

set cursorline
set cursorcolumn

autocmd VimEnter * :Vex
autocmd BufWritePre * %s/\s\+$//e

"packadd! dracula
syntax enable
"colorscheme dracula
"hi Normal guibg=NONE ctermbg=NONE
colorscheme elflord

" Netrw settings (WIP)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_altfile = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:netrw_compress = "zip"

" Open netrw to aid in splits
map <leader>n :Vex<CR>

" Close all of vim even with splits open
map <leader>q :wqa<CR>
map <leader>Q :qa!<CR>

" Keep it centered
autocmd InsertEnter * norm zz
nmap <c-d> <c-d>0zz
nmap <c-u> <c-u>0zz
nmap n nzzzv
nmap N Nzzzv
nmap * *zzzv
nmap # #zzzv
nmap J J0zz

" keep area selected
vmap < <gv
vmap > >gv
vmap x xgv

" Make Y work the same as other upercase chars
nmap Y y$

" Copy paste (Must be gvim)
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

" Open both quotes or brakets at once
inoremap " ""<left>
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap < <><left>

" jump to placehoder
map <leader>p /<+++><CR>da<i
" Place placeholder
inoremap ;p <+++>

" Moving lines up or down in every mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

autocmd FileType markdown nnoremap <leader>mi i![](<+++>)<Space><CR><CR><+++><Esc>kkF]i
autocmd FileType markdown nnoremap <leader>ml i[](<+++>)<Space><+++><Esc>F]i
" autocmd FileType markdown
noremap <leader>mb o\pagebreak<Esc>

" headings
autocmd FileType markdown nnoremap <leader>m1 I# <ESC>
autocmd FileType markdown nnoremap <leader>m2 I## <ESC>
autocmd FileType markdown nnoremap <leader>m3 I### <ESC>
autocmd FileType markdown nnoremap <leader>m4 I#### <ESC>
autocmd FileType markdown nnoremap <leader>m5 I##### <ESC>
autocmd FileType markdown nnoremap <leader>m6 I###### <ESC>

autocmd FileType markdown nnoremap <leader>mz :!echo % \| sed "s\|\.md\|\.pdf\|g" \| xargs zathura & <CR><CR>
autocmd FileType markdown nnoremap <leader>mx :!output=$(echo % \| sed "s\|\.md\|\.pdf\|g") && pandoc % -o $output <CR>
autocmd FileType markdown nnoremap <leader>mX :!output=$(echo % \| sed "s\|\.md\|\.docx\|g") && pandoc % -o $output <CR>

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

" markdown code blocks
let g:markdown_fenced_languages = ['java', 'bash', 'python', 'c']
let java_ignore_javadoc=1

nnoremap <leader>r :%s/\r//g<CR>

" Quick fix list
noremap <leader>ct :vimgrep /TODO/g **/*<CR>
noremap <leader>cd :vimgrep /DONE/g **/*<CR>
noremap <leader>cg :vimgrep //g **/*<CR>
noremap <leader>cG :vimgrep //g **/*<left><left><left><left><left><left><left>
vnoremap <leader>cg y:vimgrep /<C-r>"/g **/*<CR>
noremap <leader>cf :.cc<CR>zz
noremap <leader>co :copen<CR>
noremap <leader>cc :ccl<CR>
noremap <leader>cm :set modifiable<CR>
noremap <leader>cn :cnext<CR>zz
noremap <leader>cN :cprev<CR>zz
noremap <leader>cp :cprev<CR>zz

noremap <leader>tt :put =strftime('%A %d %B %Y')<CR>

" colored status bar
" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ "\<C-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
"set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
"set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %n\                                 " Buffer number

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
