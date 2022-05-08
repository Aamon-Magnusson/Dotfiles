nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hq :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>h1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>h2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>h3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>h4 :lua require("harpoon.ui").nav_file(4)<CR>
lua require("telescope").load_extension('harpoon')
nnoremap <leader>ht :Telescope harpoon marks<CR>
