Plug 'itchyny/lightline.vim' " Better status bar

" Lightline parameters
let g:lightline = {
\	'colorscheme': 'sonokai',
\	'component_function': {
\		'gitbranch': 'FugitiveHead',
\		'filename': 'LightlineFilename',
\		'cocstatus': 'coc#status',
\		'obsessionstatus': 'LightLineObsession'
\	}
\}

let g:lightline.active = {
\	'left': [
\		['mode'],
\		['gitbranch', 'filename'],
\		['cocstatus'] 
\	],
\	'right': [
\		['percent', 'lineinfo']
\	]
\}

let g:lightline.inactive = {
\ 'left': [
\		['mode', 'filename']
\	],
\ 'right': [
\		['percent', 'lineinfo'],
\	]
\}

let g:lightline.tabline = {
\	'left': [
\		[ 'tabs' ]
\	],
\	'right': [
\		[ 'obsessionstatus', 'close' ]
\	]
\}

let g:lightline.tab = {
\	'active': [ 'tabnum', 'filename', 'modified' ],
\	'inactive': [ 'tabnum', 'filename', 'modified' ],
\}

function! Relpath(filename)
		let cwd = getcwd()
		let s = substitute(a:filename, l:cwd, "", "g")
		echo s
		return s
endfunction

function! Test(var)
	let cwd = getcwd()
	return 'Test ' . a:var
endfunction

" Allow ligjtline to display the full path instead of just the filename
function! LightlineFilename()
	let filename = expand('%:t') !=# '' ? pathshorten(expand('%:.')) : '[No Name]'
	let modified = &modified ? ' +': ''
	return filename . modified
endfunction

function! LightLineObsession()
	let status = ObsessionStatus('On','Off')
	return status
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
