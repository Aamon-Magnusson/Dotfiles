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

" =========== "
" Auto commands
" =========== "
" Auto compile suckless programs
autocmd BufWritePost config.h,config.def.h !sudo make install clean

" Auto command to clear trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" clean /r from file
"autocmd BufReadPost * :%s/\r//g
" I'm trying to make this an autocmd but not yet ready
nmap <leader>r :%s/\r//g<CR>

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

" move splits
noremap <C-w><S-h> <A-h>
noremap <C-w><S-j> <A-j>
noremap <C-w><S-k> <A-k>
noremap <C-w><S-l> <A-l>

" jump to placehoder
map <leader>p /<+++><CR><CR>ca<

" Place placeholder
inoremap ;p <+++>

" template keybindings
nnoremap ,html :-1read $HOME/.config/nvim/Templates/template.html<CR>/<+++><CR>ca<
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

" type in original string then right arrow for new string
nnoremap <Leader>fr :%s///g<Left><Left><Left>
nnoremap <Leader>fc :%s///gc<Left><Left><Left><Left>
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>fR :%s///g<Left><Left>
nnoremap <Leader>fC :%s///gc<Left><Left><Left>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <tab> pumvisible() ? "<C-n>" :"<tab>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Markdown keymaps
autocmd FileType markdown map <leader>mt i---<CR>title:<Space><+++><CR>author:<Space>"Aamon Magnusson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR><CR><BS>---<CR><CR><+++><ESC>/<+++><CR>ca>
"header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}"

autocmd FileType markdown map <leader>mi i![](<+++>)<Space><CR><CR><+++><Esc>kkF]i
autocmd FileType markdown map <leader>ml i[](<+++>)<Space><+++><Esc>F]i
" autocmd FileType markdown
noremap <leader>mb o\pagebreak<Esc>

autocmd FileType markdown map <leader>mz :!echo % \| sed "s\|\.md\|\.pdf\|g" \| xargs zathura & <CR><CR>
autocmd FileType markdown map <leader>mx :!output=$(echo % \| sed "s\|\.md\|\.pdf\|g") && pandoc % -o $output <CR>
autocmd FileType markdown map <leader>mX :!output=$(echo % \| sed "s\|\.md\|\.docx\|g") && pandoc % -o $output <CR>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

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
source $HOME/.config/nvim/statusLine.vim

" =========== "
" Plugins
" =========== "
"
if has("win32")
	echo "Plugins not available for now at least"

	" Open both quotes or brakets at once
	inoremap " ""<left>
	inoremap { {}<left>
	inoremap ( ()<left>
	inoremap [ []<left>
	inoremap < <><left>

elseif has("unix")
	if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
		echo "Downloading junegunn/vim-plug to manage plugins..."
		silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
		silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
		autocmd VimEnter * PlugInstall
	endif

	call plug#begin()
		" LSP
		Plug 'neovim/nvim-lspconfig'
		Plug 'hrsh7th/nvim-compe' "This is deprecated, should try to figure out another autocomplete"

		" Telescope!!!
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'

		" Harpoon
		Plug 'ThePrimeagen/harpoon'

		" See if I use this (Or am allowed to use this)
		Plug 'github/copilot.vim'

		" Tpope
		Plug 'tpope/vim-surround'
		Plug 'tpope/vim-repeat'
		Plug 'glts/vim-radical'
		Plug 'glts/vim-magnum'

		" Movement
		Plug 'easymotion/vim-easymotion'

		" Markdown
		" I might be able to take this out but it stays for now
		Plug 'davidgranstrom/nvim-markdown-preview'
		Plug 'junegunn/goyo.vim'

		" nice commenting
		Plug 'numToStr/Comment.nvim'

		" show keybindings of leader
		Plug 'liuchengxu/vim-which-key'

		" gitgutter
		Plug 'airblade/vim-gitgutter'

		" color preview
		Plug 'ap/vim-css-color'

		" pairs
		Plug 'jiangmiao/auto-pairs'
	call plug#end()
	source $HOME/.config/nvim/plug.vim
	lua require('user.lsp-config')
	lua require('user.compe')
	source $HOME/.config/nvim/compe.vim
	source $HOME/.config/nvim/telescope.vim
	lua require('user.harpoon')
	source $HOME/.config/nvim/harpoon.vim
	source $HOME/.config/nvim/markdown-preview.vim
	source $HOME/.config/nvim/goyo.vim
	lua require('user.comment')
	source $HOME/.config/nvim/which-key.vim
endif
