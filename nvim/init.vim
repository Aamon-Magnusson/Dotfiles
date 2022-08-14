" for when I go to lua:
" https://www.notonlycode.org/neovim-lua-config/
" https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
"     ___
"    / _ \
"   / /_\ \ __ _ _ __ ___   ___  _ __
"   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
"   | | | | (_| | | | | | | (_) | | | |
"   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
"
"		GitHub: https://github.com/Aamon-Magnusson

" =========== "
" sets
" =========== "

" source $HOME/.config/nvim/sets.vim
lua require("sets")

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
nnoremap <leader>r :%s/\r//g<CR>

" Remove ʼ from file
" autocmd BufWritePre * :$s/ʼ//g
" nnoremap <leader>R :$s/ʼ/'/g

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

" JSON auto format
autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool

" =========== "
" Keybindings
" =========== "

" source $HOME/.config/nvim/keybindings.vim
lua require("keybindings")

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
		" Treesitter
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

		" LSP
		Plug 'neovim/nvim-lspconfig'
		Plug 'williamboman/mason.nvim'
		"This is deprecated, should try to figure out another autocomplete"
		Plug 'hrsh7th/nvim-compe'
		" WIP
		" Plug 'mhartington/formatter.nvim'

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

		" nice commenting
		Plug 'numToStr/Comment.nvim'

		" show keybindings of leader
		Plug 'liuchengxu/vim-which-key'

		" gitgutter
		Plug 'airblade/vim-gitgutter'

		" pairs
		Plug 'jiangmiao/auto-pairs'

		" Autotag
		Plug 'windwp/nvim-ts-autotag'
	call plug#end()
	" source $HOME/.config/nvim/plug.vim
	lua require('plugins.lsp-config')
	lua require('plugins.mason')
	lua require('plugins.compe')
	source $HOME/.config/nvim/Plugins/compe.vim
	" source $HOME/.config/nvim/formatter.vim
	lua require('plugins.telescope')
	source $HOME/.config/nvim/Plugins/harpoon.vim
	source $HOME/.config/nvim/Plugins/markdown-preview.vim
	lua require('plugins.comment')
	source $HOME/.config/nvim/Plugins/which-key.vim
	lua require('plugins.ts-autotag')
endif
