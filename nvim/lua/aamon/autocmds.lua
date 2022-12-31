-- I will get to this eventually
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
	" augroup ProjectDrawer
	" autocmd!
	" autocmd VimEnter * if argc() == 0 | :NvimTreeOpen | endif
	" augroup END

	" Auto-resize splits when Vim gets resized.
	autocmd VimResized * wincmd =

	" Update a buffer's contents on focus if it changed outside of Vim.
	" autocmd FocusGained,BufEnter * :checktime

	" JSON auto format
	autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
]])
