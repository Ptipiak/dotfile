Plug 'itchyny/lightline.vim' " Better status bar

" Lightline parameters
let g:lightline = {
\'colorscheme': 'sonokai',
\	'active': {
\		'left': [
\			['mode', 'paste'],
\	  	['gitbranch', 'readonly', 'filename', 'modified', 'cocstatus'] 
\	  ]
\	},
\	'component_function': {
\		'gitbranch': 'FugitiveHead',
\		'filename': 'LightlineFilename',
\		'cocstatus': 'coc#status'
\	}
\}

" Allow ligjtline to display the full path instead of just the filename
function! LightlineFilename()
	return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
		\ &filetype ==# 'unite' ? unite#get_status_string() :
		\ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
		\ expand('%:t') !=# '' ? expand('%:t') : '[No name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
