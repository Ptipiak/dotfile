call plug#begin('~/.vim/plugged')
	
	" Themes and colors
	Plug 'mhartington/oceanic-next'
	Plug 'sainnhe/sonokai'
	Plug 'ap/vim-css-color'

	" UI
	Plug 'itchyny/lightline.vim' " Better status bar addons
	Plug 'tpope/vim-fugitive' " Git addons
	Plug 'tpope/vim-obsession' " Better mksession for vim
	Plug 'tpope/vim-commentary' " Commentary on motions 
	Plug 'romainl/vim-qf' " Tame the quickfix window

	" Languages
	Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Autocomplete
	Plug 'sheerun/vim-polyglot'         " Syntax highlighting
	Plug 'vim-jp/vim-cpp'
	Plug 'ekalinin/Dockerfile.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
" Enable syntax highlighting
syntax on
" Enable file type
filetype plugin indent on
" Set the font to Hac Nerd Font mono with 12
set guifont=Hack\ Nerd\ Font\ Mono\ \12 
set t_Co=256
" Auto reload a file when it is changer from the outside
set autoread
set nobackup
" Hidde buffer instead of closing them
set hidden
" Set wildmode for auto completion
set wildmenu
" Completion behaviour
set wildmode=longest:full,full

""""""""""""""""""""""""""""""""""""""""
" Indentation option 
""""""""""""""""""""""""""""""""""""""""

" Cause I like a full tab
set tabstop=4
" The number of spaces inserted/removed when using < or >
set shiftwidth=4
" The number of spaces inserted when you press tab.
" -1 means the same value as shiftwidth
set softtabstop=-1
" Insert spaces instead of tabs
set noexpandtab
" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set nosmartindent

""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""

" Set the minimal amount of line under/above the cursor
" to 5
set scrolloff=2
" Show a marker underneath the cursor line
set cursorline
" Show the command to be executed
set showcmd
" Show number plus relative number lines
set nu rnu
" Always show status line
set laststatus=2
" Display whitespace characters
set list
" Tab character
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤
" Vertical character
set fillchars=vert:│
" Briefly show matching braces, parens, etc
set showmatch
" Enable line wrapping
set nowrap

" ColorSheme
set termguicolors
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai 

" netrw params
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1 
let g:netrw_liststyle = 1 
let g:netrw_sort_by = "extend"

" Lightline params
let g:lightline = {
\	'colorscheme': 'sonokai',
\	'active': {
\		'left': [
\			[ 'mode', 'paste' ],
\			['gitbranch', 'readonly', 'filename', 'modified' ] 
\		]
\	},
\	'component_function': {
\		'gitbranch': 'FugitiveHead',
\       'filename': 'LightlineFilename'
\	}
\}

" Allow lightline to display the full path instead of juste the filename
function! LightlineFilename()
	return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
		\ &filetype ==# 'unite' ? unite#get_status_string() :
		\ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
		\ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

""""""""""""""""""""""""""""""""""""""""
" Search options 
""""""""""""""""""""""""""""""""""""""""

" Ignore case unless an uppercase is specified in the pattern
set smartcase

"Move cursor to the matched string
set incsearch

""""""""""""""""""""""""""""""""""""""""
" Plugins params 
""""""""""""""""""""""""""""""""""""""""

" CoC params
let g:coc_global_extensions = [
	\'coc-json',
	\'coc-python',
	\'coc-clangd',
	\'coc-cmake',
	\'coc-sh',
	\'coc-java'
\]

" File specific whitespace params
autocmd FileType yaml setlocal tabstop=4 softtabstop=2 shiftwidth=2 smartindent noexpandtab 

" Commentary plugin

""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""
" Adding command to hide nu and rnu and also list
nnoremap <F3> :set list!<CR>
nnoremap <F2> :set nu! rnu!<CR>
" Select completion using tab and shift tab to select completion 
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""
" Utils script 
""""""""""""""""""""""""""""""""""""""""
function! SaveWithTS()
    let 
    autocmd BufWritePre *.txt :$put =strftime('%Y-%m-%d %T')
endfunction
