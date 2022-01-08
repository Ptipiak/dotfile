Plug 'voldikss/vim-floaterm'

set shell=zsh

nnoremap <silent> <leader>ft :FloatermToggle<CR>
tnoremap <silent> <leader>ft <C-\><C-n>:FloatermToggle<CR>

nnoremap <silent> <leader>ftk :FloatermKill<CR>
tnoremap <silent> <leader>ftk <C-\><C-n>:FloatermKill<CR>

tnoremap <Esc> <C-\><C-n>

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

augroup FloatermCustomisations
	autocmd!
	autocmd ColorScheme * highlight FloatermBorder guibg=none
augroup END
