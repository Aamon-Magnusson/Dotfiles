---------------------------
-- Function declarations --
---------------------------

require "keyMapDef"

-----------------
-- Keybindings --
-----------------

-- Open netrw to aid in splits
Nmap(
	'<leader>N',
	':Sex<CR>'
)
Nmap(
	'<leader>n',
	':Vex!<CR>'
)

-- Close all of vim even with splits open

Nmap(
	'<leader>q',
	':wqa<CR>'
)
Nmap(
	'<leader>Q',
	':qa!<CR>'
)

-- Copy paste
Vmap(
	'<leader>c',
	'"*y :let @+=@*<CR>'
)
Nmap(
	'<leader>v',
	'"+p'
)

-- Enable spell check
Nmap(
	'<leader>se',
	':set spell spelllang=en_ca<CR>'
)
Nmap(
	'<leader>sf',
	':set spell spelllang=fr_ca<CR>'
)
Nmap(
	'<leader>so',
	':set nospell<CR>'
)

-- Fix last spelling error
Nmap(
	'<leader>sl',
	'mm[s1z=`m'
)
-- function! FixLastSpellingError()
--   normal! mm[s1z=`m"
-- endfunction
-- nnoremap <leader>sl :call FixLastSpellingError()<cr>

-- Move line to the top of a paragraph
Nmap(
	'<leader>l0',
	'kmmjdd{p`m`'
)
-- function! MoveLineToTopOfList()
--   normal! kmmjdd{p`m
-- endfunction
-- nnoremap <leader>l0 :call MoveLineToTopOfList()<cr>

-- Move line to the bottom of a paragraph
Nmap(
	'<leader>l9',
	'kmmjdd}P`m'
)
-- function! MoveLineToBottomOfList()
--   normal! kmmjdd}P`m
-- endfunction
-- nnoremap <leader>l9 :call MoveLineToBottomOfList()<cr>

-- Set fold
Nmap(
	'<leader>i',
	':set fdm=indent<CR>'
)
Nmap(
	'<leader>I',
	':set fdm=syntax<CR>'
)

-- Move around splits
Nmap(
	'<C-h>',
	'<C-w>h'
)
Nmap(
	'<C-j>',
	'<C-w>j'
)
Nmap(
	'<C-k>',
	'<C-w>k'
)
Nmap(
	'<C-l>',
	'<C-w>l'
)

-- resize splits
Nmap(
	'<C-Left>',
	':vertical resize +3<CR>'
)
Nmap(
	'<C-Right>',
	':vertical resize -3<CR>'
)
Nmap(
	'<C-Up>',
	':resize +3<CR>'
)
Nmap(
	'<C-Down>',
	':resize -3<CR>'
)

-- move splits
--[[ Nmap(
	'<A-h>',
	'<C-w><S-h>'
)
Nmap(
	'<A-j>',
	'<C-w><S-j>'
)
Nmap(
	'<A-k>',
	'<C-w><S-k>'
)
Nmap(
	'<A-l>',
	'<C-w><S-l>'
) ]]

-- jump to placehoder
Nrmap(
	'<leader>p',
	'/<+++><CR><CR>ca<'
)

-- Place placeholder
Imap(
	';p',
	'<+++>'
)

-- template keybindings
Nrmap(
	',html',
	':-1read $HOME/.config/nvim/Templates/template.html<CR>/<+++><CR>ca<'
)
Nrmap(
	',c',
	':-1read $HOME/.config/nvim/Templates/template.c<CR>/<+++><CR>da<'
)
Nrmap(
	',py',
	':-1read $HOME/.config/nvim/Templates/template.py<CR>/<+++><CR>da<'
)
Nrmap(
	',sh',
	':-1read $HOME/.config/nvim/Templates/template.sh<CR>/<+++><CR>da<'
)

-- Remove highlights from searches
Nrmap(
	'<CR>',
	':nohlsearch<CR>'
)

-- Moving lines up or down in every mode
Vmap(
	'J',
	":m '>+1<CR>gv=gv"
)
Vmap(
	'K',
	":m '<-2<CR>gv=gv"
)
Imap(
	'<C-j>',
	'<esc>:m .+1<CR>==i'
)
Imap(
	'<C-k>',
	'<esc>:m .-2<CR>==i'
)
Nmap(
	'<leader>j',
	':m .+1<CR>=='
)
Nmap(
	'<leader>k',
	':m .-2<CR>=='
)

-- Keep it centered
Nmap(
	'n',
	'nzzzv'
)
Nmap(
	'N',
	'Nzzzv'
)
Nmap(
	'*',
	'*zzzv'
)
Nmap(
	'#',
	'#zzzv'
)
Nmap(
	'J',
	'J0zz'
)
Nmap(
	'<c-d>',
	'<c-d>0zz'
)
Nmap(
	'<c-u>',
	'<c-u>0zz'
)
Nmap(
	'H',
	'H0zz'
)
Nmap(
	'L',
	'L0zz'
)

-- keep area selected when shifting
Vmap(
	'<',
	'<gv'
)
Vmap(
	'>',
	'>gv'
)
Vmap(
	'x',
	'xgv'
)

-- Quickfix list
Nmap(
	'<leader>cg',
	':vimgrep //g **/*<CR>'
)
Vmap(
	'<leader>cg',
	'y:vimgrep /<C-r>"/g **/*<CR>'
)
Nmap(
	'<leader>cf',
	':.cc<CR>'
)
Nmap(
	'<leader>co',
	':copen<CR>'
)
Nmap(
	'<leader>cc',
	':ccl<CR>'
)
Nmap(
	'<leader>cm',
	':set modifiable<CR>'
)
Nmap(
	'<leader>cn',
	':cnext<CR>zz'
)
Nmap(
	'<leader>cN',
	':cprev<CR>zz'
)

-- Find and replace
-- type in original string then right arrow for new string
Nmap(
	'<Leader>fr',
	':%s///g<Left><Left><Left>'
)
Nmap(
	'<Leader>fc',
	':%s///gc<Left><Left><Left><Left>'
)
-- Press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.
Nmap(
	'<Leader>fR',
	':%s///g<Left><Left>'
)
Nmap(
	'<Leader>fC',
	':%s///gc<Left><Left><Left>'
)

-- Source Vim config file.
Nmap(
	'<Leader>vs',
	':source $MYVIMRC<CR>'
)

-- Open nvim config file
Nmap(
	'<leader>ve',
	':e $MYVIMRC<CR>'
)

-- Navigate the complete menu items like CTRL+n / CTRL+p would.
vim.cmd([[
	inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
	inoremap <expr> <tab> pumvisible() ? "<C-n>" :"<tab>"
	inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
	inoremap <expr> <S-tab> pumvisible() ? "<C-p>" : "<S-tab>"
]])
-- Select the complete menu item like CTRL+y would.
vim.cmd([[
	inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
	inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
]])
-- Cancel the complete menu item like CTRL+e would.
vim.cmd([[
	inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"
]])

-- Markdown keymaps
-- autocmd FileType markdown nnoremap <leader>mt i---<CR>title:<Space><+++><CR>author:<Space>"Aamon Magnusson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR><CR><BS>---<CR><CR><+++><ESC>/<+++><CR>ca>
--header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}"

Nmap(
	'<leader>mi',
	'i![](<+++>)<Space><CR><CR><+++><Esc>kkF]i'
)
Nmap(
	'<leader>ml',
	'i[](<+++>)<Space><+++><Esc>F]i'
)
-- autocmd FileType markdown
Nmap(
	'<leader>mb',
	'o\\pagebreak<Esc>'
)

-- headings
Nmap(
	'<leader>m1',
	'I# <ESC>'
)
Nmap(
	'<leader>m2',
	'I## <ESC>'
)
Nmap(
	'<leader>m3',
	'I### <ESC>'
)
Nmap(
	'<leader>m4',
	'I#### <ESC>'
)
Nmap(
	'<leader>m5',
	'I##### <ESC>'
)
Nmap(
	'<leader>m6',
	'I###### <ESC>'
)

Nmap(
	'<leader>mc',
	'IPAGE CHANGE: <ESC>gcc'
)
Nmap(
	'<leader>ms',
	'I<span id="p<esc>A"></span><ESC>'
)

Nrmap(
	'<leader>mc',
	'dipO```<+++><CR>```<ESC>P/<+++><CR>ca<'
)

-- currently not functional
-- autocmd FileType markdown nnoremap <leader>mq :s/\\S\\.\\s/\\.\\r/g<CR>

Nmap(
	'<leader>mz',
	':!echo % | sed "s|\\.md|\\.pdf|g" | xargs zathura & <CR><CR>'
)
Nmap(
	'<leader>mx',
	':!output=$(echo % | sed "s|\\.md|\\.pdf|g") && pandoc % -o $output <CR>'
)
Nmap(
	'<leader>mX',
	':!output=$(echo % | sed "s|\\.md|\\.docx|g") && pandoc % -o $output <CR>'
)

Nmap(
	'<leader>mg',
	':!test .md || touch .md | echo -e "[Go back](%)\\n\\n\\# " > .md <CR><CR>'
)

Nmap(
	'<leader>mti',
	':-1read $HOME/.config/nvim/Templates/imageBlock<CR>'
)
Nmap(
	'<leader>mtu',
	':-1read $HOME/.config/nvim/Templates/umlBlock<CR>'
)
Nmap(
	'<leader>mtd',
	':-1read $HOME/.config/nvim/Templates/descriptionBlock<CR>'
)

Nmap(
	'<leader>mj',
	':call FormatSentence()<CR>zz'
)

vim.cmd([[
function! FormatSentence()
		" save line
		let fline = line(".")
		" go to next [.:?]
		execute "normal! /[\\.:?]\<cr>"
		" save line
		let sline = line(".")
		" if on another line
		if fline != sline
			" line selection mode
			execute "normal! V"
			" go back to initial line
			execute fline
			" join lines
			execute "normal! J"
		endif
		execute "normal! ^"

		" save current line
		let fline = line(".")
		" go to next period with another sentence after it
		execute "normal! /\\. [a-zA-Z]\\+\<cr>"
		" save current line
		let sline = line(".")

		" if period is on same line
		if fline == sline
			" Replace period that has an additional paragraph after it with a newline
			s/\. /.\r&/
			" Go to next line and remove first period and space
			s/^\. //
		else
			" go back to initial line, go to next line
			execute fline
			execute "normal! j"
		endif
		" go to beginning of line
		execute "normal! ^"
	endfunction
]])

-- The following keymaps only work in regular visual mode

Vmap(
	'<leader>mi',
	'A*<esc>gvo<esc>i*<esc>'
)

Vmap(
	'<leader>mb',
	'A**<esc>gvo<esc>i**<esc>'
)

Vmap(
	'<leader>mc',
	'A`<esc>gvo<esc>i`<esc>'
)

Nmap(
	'<leader>mJ',
	':!xdg-open http://127.0.0.1:4000 &<CR><CR>'
)
Nmap(
	'<leader>mo',
	':!xdg-open http://127.0.0.1:4000$(pwd | sed "s|$(git rev-parse --show-toplevel)||") & <CR><CR> '
)

-- uml stuff
Nmap(
	'<leader>ug',
	':!plantuml % -tsvg<CR>'
)
-- The following only works for .puml
Nmap(
	'<leader>uv',
	':!echo % | sed "s|\\.puml|\\.svg|g" | xargs sxiv & <CR><CR>'
)
Nmap(
	'<leader>ub',
	'ggO@startuml<CR><ESC>Go@enduml<ESC>gg0'
)
Nmap(
	'<leader>uc',
	'ggo!theme<Space>plain<CR>hide<Space>empty<Space>fields<CR>hide<Space>empty<Space>methods<CR>hide<Space>circle<CR>skinparam<Space>linetype<Space>ortho<CR>allowmixing<ESC>gg0'
)
Nmap(
	'<leader>us',
	'ggo!theme<Space>plain<CR>skinparam<Space>sequenceMessageAlign<Space>center<CR>hide<Space>footbox<ESC>gg0'
)
Nmap(
	'<leader>ui',
	'i«interface»<ESC>'
)
Nmap(
	'<leader>ud',
	':!xdg-open https://plantuml.com &<CR><CR>'
)

-- Save file as sudo when no sudo permissions
Cmap(
	'w!!',
	'w !sudo tee > /dev/null %'
)

-- execute current file
Nmap(
	'<leader>e',
	':!./%<CR>'
)
