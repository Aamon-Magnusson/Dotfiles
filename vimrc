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
nnoremap <silent> <CR> :nohlsearch<CR>
set relativenumber
set nu
set lazyredraw
set showmode

set cursorline
set cursorcolumn

autocmd VimEnter * :Vex
"autocmd BufWritePre * %s/\s\+$//e
set timeoutlen=2000

"packadd! dracula
syntax enable
"colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
colorscheme elflord

" Netrw settings (WIP)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_altfile = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_compress = "zip"

" Open netrw to aid in splits
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <leader><space> :call ToggleNetrw()<CR>

map <silent> <leader>n :vs<CR>
map <silent> <leader>N :sp<CR>

" Close all of vim even with splits open
map <silent> <leader>q :wqa<CR>
map <silent> <leader>Q :qa!<CR>

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
vnoremap <silent> <leader>y "*y :let @+=@*<CR>
map <silent> <leader>v "+p

" Enable spell check
map <silent> <leader>se :set spell spelllang=en_ca<CR>
map <silent> <leader>sf :set spell spelllang=fr_ca<CR>
map <silent> <leader>so :set nospell<CR>
" Fix last spelling error
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <silent> <leader>sl :call FixLastSpellingError()<cr>

" Open both quotes or brakets at once
inoremap " ""<left>
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap < <><left>

" jump to placehoder
map <leader>p /<+++><CR><CR>ca<
" Place placeholder
inoremap ;p <+++>

" Moving lines up or down in every mode
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv
inoremap <silent> <C-j> <esc>:m .+1<CR>==i
inoremap <silent> <C-k> <esc>:m .-2<CR>==i
nnoremap <silent> <leader>j :m .+1<CR>==
nnoremap <silent> <leader>k :m .-2<CR>==

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
nnoremap <silent> <leader>l0 :call MoveLineToTopOfList()<cr>

" Move line to the bottom of a paragraph
function! MoveLineToBottomOfList()
  normal! kmmjdd}P`m
endfunction
nnoremap <silent> <leader>l9 :call MoveLineToBottomOfList()<cr>

" markdown code blocks
let g:markdown_fenced_languages = ['java', 'bash', 'python', 'c']
let java_ignore_javadoc=1

nnoremap <leader>r :%s/\r//g<CR>

" Place todo entry
noremap <silent> <leader>td I-<space>[<space>]<space>
noremap <silent> <leader>tl ^la[<space>]<space>

" Quick fix list
noremap <silent> <leader>ct :vimgrep /TODO\\|\[ ] /g **/*<CR>
noremap <silent> <leader>cp :vimgrep /TODO\\|\[~] /g **/*<CR>
noremap <silent> <leader>cd :vimgrep /DONE\\|\[X] /g **/*<CR>
noremap <silent> <leader>ctm :vimgrep /\%(\%3l\)Meeting/g **/*<CR>
noremap <silent> <leader>cts :vimgrep /\%(\%3l\)Scan/g **/*<CR>
noremap <silent> <leader>ctn :vimgrep /\%(\%3l\)Note/g **/*<CR>
noremap <leader>ctt :vimgrep /\%(\%3l\)/g **/*<left><left><left><left><left><left><left>
noremap <silent> <leader>cg :vimgrep //g **/*<CR>
noremap <leader>cG :vimgrep //g **/*<left><left><left><left><left><left><left>
vnoremap <silent> <leader>cg y:vimgrep /<C-r>"/g **/*<CR>
noremap <silent> <leader>cf :.cc<CR>zz
noremap <silent> <leader>co :copen<CR>
noremap <silent> <leader>cc :ccl<CR>
noremap <silent> <leader>cm :set modifiable<CR>
noremap <silent> <leader>cn :cnext<CR>zz
noremap <silent> <leader>cN :cprev<CR>zz
"noremap <silent> <leader>cp :cprev<CR>zz

noremap <silent> <leader>tt :put =strftime('%A %d %B %Y')<CR>

" Open vimrc
noremap <silent> <leader>ev :e $MYVIMRC<CR>

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
