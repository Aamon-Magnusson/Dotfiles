local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>ha', ":lua require('harpoon.mark').add_file()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>hq', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h1', ":lua require('harpoon.ui').nav_files(1)<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h2', ":lua require('harpoon.ui').nav_files(2)<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h3', ":lua require('harpoon.ui').nav_files(3)<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>h4', ":lua require('harpoon.ui').nav_files(4)<CR>", opts)
require("telescope").load_extension("harpoon")
vim.api.nvim_set_keymap('n', '<leader>ht', ":Telescope harpoon marks<CR>", opts)
