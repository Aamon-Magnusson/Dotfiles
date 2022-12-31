-- Manage splits
vim.api.nvim_set_keymap( "n", "<leader>n", ":vs<CR>", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<leader>N", ":sp<CR>", {noremap = true, silent = true} )
-- Close vim
vim.api.nvim_set_keymap( "n", "<leader>q", ":wqa<CR>", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<leader>Q", ":qa!<CR>", {noremap = true, silent = true} )
-- Copy paste
vim.api.nvim_set_keymap( "v", "<leader>y", '"*y :let @+=@*<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<leader>v", '"+p"', {noremap = true, silent = true} )
-- spell check
vim.api.nvim_set_keymap( "n", "<leader>se", ":set spell spelllang=en_ca<CR>", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<leader>sf", ":set spell spelllang=fr<CR>", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<leader>so", ":set nospell<CR>", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<leader>sl", "mm[s1z=`m", {noremap = true, silent = true} )
-- Placeholder
vim.api.nvim_set_keymap( "n", "<leader>p", "/<+++><CR><CR>ca<", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "i", ";p", "<+++>", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<CR>", ":nohlsearch<CR>", {silent = true} )
-- Move lines
vim.api.nvim_set_keymap( "v", 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "v", 'K', ":m '<-2<CR>gv=gv",{noremap = true, silent = true}  )
vim.api.nvim_set_keymap( "i", '<C-j>', '<esc>:m .+1<CR>==i', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "i", '<C-k>', '<esc>:m .-2<CR>==i', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>j', ':m .+1<CR>==', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>k', ':m .-2<CR>==', {noremap = true, silent = true} )
-- Keep it centered
vim.api.nvim_set_keymap( "n", "n", "nzzzv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "N", "Nzzzv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "*", "*zzzv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "#", "#zzzv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "J", "J0zz", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<c-d>", "<c-d>zz0", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "<c-u>", "<c-u>zz0", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "H", "H0zz", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "M", "M0zz", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", "L", "L0zz", {noremap = true, silent = true} )
-- Keep area visually selected
vim.api.nvim_set_keymap( "v", "<", "<gv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "v", ">", ">gv", {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "v", "x", "xgv", {noremap = true, silent = true} )
-- Quickfix list
vim.api.nvim_set_keymap( "n", '<leader>cG', ':vimgrep //g **/*<left><left><left><left><left><left><left>', {noremap = true} )
vim.api.nvim_set_keymap( "n", '<leader>cg', ':vimgrep //g **/*<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "v", '<leader>cg', 'y:vimgrep /<C-r>"/g **/*<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>cf', ':.cc<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>co', ':copen<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>cc', ':ccl<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>cm', ':set modifiable<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>cn', ':cnext<CR>zz', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>cN', ':cprev<CR>zz', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( "n", '<leader>cp', ':cprev<CR>zz', {noremap = true, silent = true} )
-- Find and replace
-- type in original string then right arrow for new string
vim.api.nvim_set_keymap( "n", '<Leader>fr', ':%s///g<Left><Left><Left>', {noremap = true} )
vim.api.nvim_set_keymap( "n", '<Leader>fc', ':%s///gc<Left><Left><Left><Left>', {noremap = true} )
-- Press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.
vim.api.nvim_set_keymap( "n", '<Leader>fR', ':%s///g<Left><Left>', {noremap = true} )
vim.api.nvim_set_keymap( "n", '<Leader>fC', ':%s///gc<Left><Left><Left>', {noremap = true} )
-- Save file as sudo when no sudo permissions
vim.api.nvim_set_keymap( "c", 'w!!', 'w !sudo tee > /dev/null %', {noremap = true, silent = true} )
-- execute current file
vim.api.nvim_set_keymap( "n", '<leader>e', ':!./%<CR>', {noremap = true, silent = true} )
-- Remove \r from file
vim.api.nvim_set_keymap( "n", "<leader>r", ":%s/\r//g<CR>", {noremap = true, silent = true} )

-- I'll add these back in eventually, I just don't feel like it right now
-- -- Markdown keymaps
-- -- autocmd FileType markdown nnoremap <leader>mt i---<CR>title:<Space><+++><CR>author:<Space>"Aamon Magnusson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR><CR><BS>---<CR><CR><+++><ESC>/<+++><CR>ca>
-- --header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}"
--
-- Nmap(
-- 	'<leader>mi',
-- 	'i![](<+++>)<Space><CR><CR><+++><Esc>kkF]i'
-- )
-- Nmap(
-- 	'<leader>ml',
-- 	'i[](<+++>)<Space><+++><Esc>F]i'
-- )
-- -- autocmd FileType markdown
-- Nmap(
-- 	'<leader>mb',
-- 	'o\\pagebreak<Esc>'
-- )
--
-- -- headings
-- Nmap(
-- 	'<leader>m1',
-- 	'I# <ESC>'
-- )
-- Nmap(
-- 	'<leader>m2',
-- 	'I## <ESC>'
-- )
-- Nmap(
-- 	'<leader>m3',
-- 	'I### <ESC>'
-- )
-- Nmap(
-- 	'<leader>m4',
-- 	'I#### <ESC>'
-- )
-- Nmap(
-- 	'<leader>m5',
-- 	'I##### <ESC>'
-- )
-- Nmap(
-- 	'<leader>m6',
-- 	'I###### <ESC>'
-- )
--
-- Nmap(
-- 	'<leader>mc',
-- 	'IPAGE CHANGE: <ESC>gcc'
-- )
-- Nmap(
-- 	'<leader>ms',
-- 	'I<span id="p<esc>A"></span><ESC>'
-- )
--
-- Nrmap(
-- 	'<leader>mc',
-- 	'dipO```<+++><CR>```<ESC>P/<+++><CR>ca<'
-- )
--
-- -- currently not functional
-- -- autocmd FileType markdown nnoremap <leader>mq :s/\\S\\.\\s/\\.\\r/g<CR>
--
-- Nmap(
-- 	'<leader>mz',
-- 	':!echo % | sed "s|\\.md|\\.pdf|g" | xargs zathura & <CR><CR>'
-- )
-- Nmap(
-- 	'<leader>mx',
-- 	':!output=$(echo % | sed "s|\\.md|\\.pdf|g") && pandoc % -o $output <CR>'
-- )
-- Nmap(
-- 	'<leader>mX',
-- 	':!output=$(echo % | sed "s|\\.md|\\.docx|g") && pandoc % -o $output <CR>'
-- )
--
-- Nmap(
-- 	'<leader>mg',
-- 	':!test .md || touch .md | echo -e "[Go back](%)\\n\\n\\# " > .md <CR><CR>'
-- )
--
-- Nmap(
-- 	'<leader>mti',
-- 	':-1read $HOME/.config/nvim/Templates/imageBlock<CR>'
-- )
-- Nmap(
-- 	'<leader>mtu',
-- 	':-1read $HOME/.config/nvim/Templates/umlBlock<CR>'
-- )
-- Nmap(
-- 	'<leader>mtd',
-- 	':-1read $HOME/.config/nvim/Templates/descriptionBlock<CR>'
-- )
--
-- Nmap(
-- 	'<leader>mj',
-- 	':call FormatSentence()<CR>zz'
-- )
--
-- vim.cmd([[
-- function! FormatSentence()
-- 		" save line
-- 		let fline = line(".")
-- 		" go to next [.:?]
-- 		execute "normal! /[\\.:?]\<cr>"
-- 		" save line
-- 		let sline = line(".")
-- 		" if on another line
-- 		if fline != sline
-- 			" line selection mode
-- 			execute "normal! V"
-- 			" go back to initial line
-- 			execute fline
-- 			" join lines
-- 			execute "normal! J"
-- 		endif
-- 		execute "normal! ^"
--
-- 		" save current line
-- 		let fline = line(".")
-- 		" go to next period with another sentence after it
-- 		execute "normal! /\\. [a-zA-Z]\\+\<cr>"
-- 		" save current line
-- 		let sline = line(".")
--
-- 		" if period is on same line
-- 		if fline == sline
-- 			" Replace period that has an additional paragraph after it with a newline
-- 			s/\. /.\r&/
-- 			" Go to next line and remove first period and space
-- 			s/^\. //
-- 		else
-- 			" go back to initial line, go to next line
-- 			execute fline
-- 			execute "normal! j"
-- 		endif
-- 		" go to beginning of line
-- 		execute "normal! ^"
-- 	endfunction
-- ]])
--
-- -- The following keymaps only work in regular visual mode
--
-- Vmap(
-- 	'<leader>mi',
-- 	'A*<esc>gvo<esc>i*<esc>'
-- )
--
-- Vmap(
-- 	'<leader>mb',
-- 	'A**<esc>gvo<esc>i**<esc>'
-- )
--
-- Vmap(
-- 	'<leader>mc',
-- 	'A`<esc>gvo<esc>i`<esc>'
-- )
--
-- Nmap(
-- 	'<leader>mJ',
-- 	':!xdg-open http://127.0.0.1:4000 &<CR><CR>'
-- )
-- Nmap(
-- 	'<leader>mo',
-- 	':!xdg-open http://127.0.0.1:4000$(pwd | sed "s|$(git rev-parse --show-toplevel)||") & <CR><CR> '
-- )
--
-- -- uml stuff
-- Nmap(
-- 	'<leader>ug',
-- 	':!plantuml % -tsvg<CR>'
-- )
-- -- The following only works for .puml
-- Nmap(
-- 	'<leader>uv',
-- 	':!echo % | sed "s|\\.puml|\\.svg|g" | xargs sxiv & <CR><CR>'
-- )
-- Nmap(
-- 	'<leader>ub',
-- 	'ggO@startuml<CR><ESC>Go@enduml<ESC>gg0'
-- )
-- Nmap(
-- 	'<leader>uc',
-- 	'ggo!theme<Space>plain<CR>hide<Space>empty<Space>fields<CR>hide<Space>empty<Space>methods<CR>hide<Space>circle<CR>skinparam<Space>linetype<Space>ortho<CR>allowmixing<ESC>gg0'
-- )
-- Nmap(
-- 	'<leader>us',
-- 	'ggo!theme<Space>plain<CR>skinparam<Space>sequenceMessageAlign<Space>center<CR>hide<Space>footbox<ESC>gg0'
-- )
-- Nmap(
-- 	'<leader>ui',
-- 	'i«interface»<ESC>'
-- )
-- Nmap(
-- 	'<leader>ud',
-- 	':!xdg-open https://plantuml.com &<CR><CR>'
-- )
