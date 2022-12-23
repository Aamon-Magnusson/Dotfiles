vim.api.nvim_set_keymap( 'n', '<leader>tf', ':Telescope find_files<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( 'n', '<leader>tg', '<cmd>Telescope live_grep<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( 'n', '<leader>tb', '<cmd>Telescope buffers<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( 'n', '<leader>th', '<cmd>Telescope help_tags<CR>', {noremap = true, silent = true} )
