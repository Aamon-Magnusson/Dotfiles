" Open netrw to aid in splits
nnoremap <leader>N :Sex<CR>
nnoremap <leader>n :Vex!<CR>

" Close all of vim even with splits open
nnoremap <leader>q :wqa<CR>
nnoremap <leader>Q :qa!<CR>

" Make Y work the same as other upercase chars
nmap Y y$

" Copy paste
vnoremap <leader>c "*y :let @+=@*<CR>
nnoremap <leader>v "+p

" Enable spell check
nnoremap <leader>se :set spell spelllang=en_ca<CR>
nnoremap <leader>sf :set spell spelllang=fr_ca<CR>
nnoremap <leader>so :set nospell<CR>

" Fix last spelling error
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>sl :call FixLastSpellingError()<cr>

" Move line to the top of a paragraph
function! MoveLineToTopOfList()
  normal! kmmjdd{p`m
endfunction
nnoremap <leader>l0 :call MoveLineToTopOfList()<cr>

" Move line to the bottom of a paragraph
function! MoveLineToBottomOfList()
  normal! kmmjdd}P`m
endfunction
nnoremap <leader>l9 :call MoveLineToBottomOfList()<cr>

" Set fold
map <leader>i :set fdm=indent<CR>
map <leader>I :set fdm=syntax<CR>

" Move around splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" resize splits
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" move splits
noremap <C-w><S-h> <A-h>
noremap <C-w><S-j> <A-j>
noremap <C-w><S-k> <A-k>
noremap <C-w><S-l> <A-l>

" jump to placehoder
map <leader>p /<+++><CR><CR>ca<

" Place placeholder
inoremap ;p <+++>

" template keybindings
nnoremap ,html :-1read $HOME/.config/nvim/Templates/template.html<CR>/<+++><CR>ca<
nnoremap ,c :-1read $HOME/.config/nvim/Templates/template.c<CR>/<+++><CR>da<
nnoremap ,py :-1read $HOME/.config/nvim/Templates/template.py<CR>/<+++><CR>da<
nnoremap ,sh :-1read $HOME/.config/nvim/Templates/template.sh<CR>/<+++><CR>da<

" Remove highlights from searches
nnoremap <CR> :nohlsearch<CR>

" Moving lines up or down in every mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap J J0zz

" keep area selected when shifting
vnoremap < <gv
vnoremap > >gv
vnoremap x xgv

" Quickfix list
noremap <leader>cg :vimgrep //g **/*<CR>
vnoremap <leader>cg y:vimgrep /<C-r>"/g **/*<CR>
noremap <leader>cf :.cc<CR>
noremap <leader>co :copen<CR>
noremap <leader>cc :ccl<CR>
noremap <leader>cm :set modifiable<CR>
noremap <leader>cn :cnext<CR>zz
noremap <leader>cN :cprev<CR>zz

" type in original string then right arrow for new string
nnoremap <Leader>fr :%s///g<Left><Left><Left>
nnoremap <Leader>fc :%s///gc<Left><Left><Left><Left>
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>fR :%s///g<Left><Left>
nnoremap <Leader>fC :%s///gc<Left><Left><Left>

" Source Vim config file.
nnoremap <Leader>vs :source $MYVIMRC<CR>

" Open init.vim
nnoremap <leader>ve :e $MYVIMRC<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <tab> pumvisible() ? "<C-n>" :"<tab>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
inoremap <expr> <S-tab> pumvisible() ? "<C-p>" : "<S-tab>"
" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Markdown keymaps
" autocmd FileType markdown nnoremap <leader>mt i---<CR>title:<Space><+++><CR>author:<Space>"Aamon Magnusson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR><CR><BS>---<CR><CR><+++><ESC>/<+++><CR>ca>
"header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}"

autocmd FileType markdown nnoremap <leader>mi i![](<+++>)<Space><CR><CR><+++><Esc>kkF]i
autocmd FileType markdown nnoremap <leader>ml i[](<+++>)<Space><+++><Esc>F]i
" autocmd FileType markdown
noremap <leader>mb o\pagebreak<Esc>

" headings
autocmd FileType markdown nnoremap <leader>m1 I# <ESC>
autocmd FileType markdown nnoremap <leader>m2 I## <ESC>
autocmd FileType markdown nnoremap <leader>m3 I### <ESC>
autocmd FileType markdown nnoremap <leader>m4 I#### <ESC>
autocmd FileType markdown nnoremap <leader>m5 I##### <ESC>
autocmd FileType markdown nnoremap <leader>m6 I###### <ESC>

autocmd FileType markdown nnoremap <leader>mc IPAGE CHANGE: <ESC>gcc
autocmd FileType markdown nnoremap <leader>ms I<span id="p<esc>A"></span><ESC>

autocmd FileType markdown nnoremap <leader>mc dipO```<+++><CR>```<ESC>P/<+++><CR>ca<

" currently not functional
" autocmd FileType markdown nnoremap <leader>mq :s/\\S\\.\\s/\\.\\r/g<CR>

autocmd FileType markdown nnoremap <leader>mz :!echo % \| sed "s\|\.md\|\.pdf\|g" \| xargs zathura & <CR><CR>
autocmd FileType markdown nnoremap <leader>mJ :!xdg-open http://127.0.0.1:4000 &<CR><CR>
autocmd FileType markdown nnoremap <leader>mx :!output=$(echo % \| sed "s\|\.md\|\.pdf\|g") && pandoc % -o $output <CR>
autocmd FileType markdown nnoremap <leader>mX :!output=$(echo % \| sed "s\|\.md\|\.docx\|g") && pandoc % -o $output <CR>

autocmd FileType markdown nnoremap <leader>mg :!test .md \|\| touch .md \| echo -e "[Go back](%)\n\n\# " > .md <CR><CR>

autocmd FileType markdown nnoremap <leader>mti :-1read $HOME/.config/nvim/Templates/imageBlock<CR>
autocmd FileType markdown nnoremap <leader>mtu :-1read $HOME/.config/nvim/Templates/umlBlock<CR>
autocmd FileType markdown nnoremap <leader>mtd :-1read $HOME/.config/nvim/Templates/descriptionBlock<CR>

autocmd FileType markdown nnoremap <leader>mj :call FormatSentence()<CR>zz

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

" uml stuff
nnoremap <leader>ug :!plantuml % -tsvg<CR>
" The following only works for .puml
nnoremap <leader>uv :!echo % \| sed "s\|\.puml\|\.svg\|g" \| xargs sxiv & <CR><CR>
nnoremap <leader>ub ggO@startuml<CR><ESC>Go@enduml<ESC>gg0
nnoremap <leader>uc ggo!theme<Space>plain<CR>hide<Space>empty<Space>fields<CR>hide<Space>empty<Space>methods<CR>hide<Space>circle<CR>skinparam<Space>linetype<Space>ortho<CR>allowmixing<ESC>gg0
nnoremap <leader>us ggo!theme<Space>plain<CR>skinparam<Space>sequenceMessageAlign<Space>center<CR>hide<Space>footbox<ESC>gg0
nnoremap <leader>ui i«interface»<ESC>
nnoremap <leader>ud :!xdg-open https://plantuml.com &<CR><CR>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" execute current file
nnoremap <leader>e :!./%<CR>
