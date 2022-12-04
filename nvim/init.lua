-- for when I go to lua:
-- https://www.notonlycode.org/neovim-lua-config/
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
--     ___
--    / _ \
--   / /_\ \ __ _ _ __ ___   ___  _ __
--   |  _  |/ _` | '_ ` _ \ / _ \| '_ \
--   | | | | (_| | | | | | | (_) | | | |
--   \_| |_/\__,_|_| |_| |_|\___/|_| |_|
--
--		GitHub: https://github.com/Aamon-Magnusson

---------
-- sets
---------

-- source $HOME/.config/nvim/sets.vim
require("sets")

-----------------
-- Auto commands
-----------------
vim.cmd([[
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

]])

----------------
-- Keybindings
----------------

-- source $HOME/.config/nvim/keybindings.vim
require("keybindings")

-------------
-- Themeing
-------------
vim.cmd([[
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

]])

-------------
-- Plugins
-------------

-- It's dirty, and only works with current nvim, on linux systems, but I'm ok with that

if (os.execute("test -d $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim") == 0)
then
	require('plugins')

	require('plugins.lsp-config')
	require('plugins.mason')
	require('plugins.compe')
	-- source $HOME/.config/nvim/Plugins/compe.vim
	-- source $HOME/.config/nvim/formatter.vim
	require('plugins.telescope')
	require('plugins.harpoon')
	--source $HOME/.config/nvim/Plugins/harpoon.vim
	require('plugins.markdown-preview')
	-- source $HOME/.config/nvim/Plugins/markdown-preview.vim
	require('plugins.comment')
	require('plugins.which-key')
	-- source $HOME/.config/nvim/Plugins/which-key.vim
	--lua require('plugins.ts-autotag')

else
	os.execute("git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim")

	require('plugins')

	vim.cmd([[
		:PackerInstall
	]])

	require('plugins.lsp-config')
	require('plugins.mason')
	require('plugins.compe')
	-- source $HOME/.config/nvim/Plugins/compe.vim
	-- source $HOME/.config/nvim/formatter.vim
	require('plugins.telescope')
	require('plugins.harpoon')
	--source $HOME/.config/nvim/Plugins/harpoon.vim
	require('plugins.markdown-preview')
	-- source $HOME/.config/nvim/Plugins/markdown-preview.vim
	require('plugins.comment')
	require('plugins.which-key')
	-- source $HOME/.config/nvim/Plugins/which-key.vim
	--lua require('plugins.ts-autotag')
end
