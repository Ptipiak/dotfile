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
  let filename = expand('%t') !=# '' ? expand('%t') : '[No Name]'
  let modified = &modified ? ' +': ''
  return filename . modified
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
