local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>', ":WhichKey '<Space>'<CR>", opts)
vim.cmd([[
	set timeoutlen=1000
]])
