vim.cmd([[
	" colored status bar (WIP)
	" status bar colors
	au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
	au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
	hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

	" Word count function
	let g:word_count="<unknown>"
	function WordCount()
		return g:word_count
	endfunction
	function UpdateWordCount()
		let lnum = 1
		let n = 0
		while lnum <= line('$')
			let n = n + len(split(getline(lnum)))
			let lnum = lnum + 1
		endwhile
		let g:word_count = n
	endfunction

	set updatetime=1000
	augroup WordCounter
		au! CursorHold,CursorHoldI * call UpdateWordCount()
	augroup END

	" Status line
	" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

	" Status Line Custom
	let g:currentmode={
	    \ 'n'  		: 'Normal',
	    \ 'no' 		: 'Normal·Operator Pending',
	    \ 'v'  		: 'Visual',
	    \ 'V'  		: 'V·Line',
	    \ "\<C-V>" 	: 'V·Block',
	    \ 's'  		: 'Select',
	    \ 'S'  		: 'S·Line',
	    \ '^S' 		: 'S·Block',
	    \ 'i'  		: 'Insert',
	    \ 'R'  		: 'Replace',
	    \ 'Rv' 		: 'V·Replace',
	    \ 'c'  		: 'Command',
	    \ 'cv' 		: 'Vim Ex',
	    \ 'ce' 		: 'Ex',
	    \ 'r'  		: 'Prompt',
	    \ 'rm' 		: 'More',
	    \ 'r?' 		: 'Confirm',
	    \ '!'  		: 'Shell',
	    \ 't'  		: 'Terminal'
	    \}

	set laststatus=2
	set noshowmode
	set statusline=
	set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
	set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
	set statusline+=%3*│                                     " Separator
	set statusline+=%2*\ %Y\                                 " FileType
	set statusline+=%3*│                                     " Separator
	set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
	"set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
	set statusline+=%=                                       " Right Side
	set statusline+=\ %{WordCount()}\ words,
	set statusline+=%2*\ col:\ %02v\                         " Colomn number
	set statusline+=%3*│                                     " Separator
	set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
	set statusline+=%0*\ %n\                                 " Buffer number

	hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
	hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
	hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
	hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
]])
