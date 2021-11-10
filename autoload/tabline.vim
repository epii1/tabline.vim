function! tabline#filename(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
	return empty(name) ? '[No Name]' : name
endfunction

function! tabline#numtab()
	let s = ''
	for i in range(tabpagenr('$'))
		let n = i + 1
		if n == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		let s .= n . ':%{tabline#filename(' . n . ')} '
	endfor
	return s
endfunction
