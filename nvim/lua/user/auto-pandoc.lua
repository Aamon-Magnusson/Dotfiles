vim.api.nvim_buf_set_keymap('0', 'n', '<leader>mg', ':silent w<bar>lua require("auto-pandoc").run_pandoc()<cr>', {noremap = true, silent = true})
