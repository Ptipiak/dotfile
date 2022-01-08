"																		 ________
"																	 |\\#######\
"																	 |#\\#######\
"																	 |##\\#######\
"																	 |###\\#######\
"																	 #####\\#######\
"													_______,#######|\#######\
"													\W############W  \#######\
"													 \W##########W		\#######\
"														'#########'			 \#######\
"															 ¯¯¯¯¯					¯¯¯¯¯¯¯¯
"
"				Personal vim configuration of Raphael Beck-Protoy 
"				inspired from Jess Archer <jess@jessarcher.com>

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

" set backupdir=~/.local/share/nvim/backup//
" set undofile
set clipboard=unnamedplus
set cmdheight=2
set confirm
set expandtab " convert tab to spaces
set exrc
set hidden
set ignorecase
set incsearch
set list
set listchars=tab:›–,eol:¬,trail:¤
set mouse=a
set nobackup
set nojoinspaces
set noro
set nowrap
set nowritebackup
set number " line number
set redrawtime=10000 " Allow more time for loading syntax on large files
set ruler
set scrolloff=8
set shiftwidth=0 " if 0 then equal tabstop
set shortmess+=c
set showmatch
set showmode
set sidescrolloff=8
set signcolumn=yes:1 " left column sign and size
set smartcase
set smarttab
set spell
set splitright
set splitbelow
set tabstop=2 " the length in spaces for one tab
set termguicolors
set title
set updatetime=300 " Reduce time for highlighting other references
set wildmode=longest:full,full

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>k :nohlsearch<CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program (not working on WSL obvi)
" nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Assert vim plug is installed and update ?

call plug#begin('~/.local/share/nvim/plugged')
	source ~/.config/nvim/plugins/coc.vim 
	source ~/.config/nvim/plugins/colorthemes.vim 
	source ~/.config/nvim/plugins/commentary.vim 
	source ~/.config/nvim/plugins/floaterm.vim 
	source ~/.config/nvim/plugins/fugitive.vim 
	source ~/.config/nvim/plugins/lightline.vim 
	source ~/.config/nvim/plugins/python.vim 
	source ~/.config/nvim/plugins/surround.vim 
  source ~/.config/nvim/plugins/netrw.vim
call plug#end()
doautocmd User PlugLoaded

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

augroup FileTypeOverrides
	" autocmd FileType yaml setlocal tabstop=4 softtabstop=2 shiftwidth=2 smartindent noexpandtab
	autocmd TermOpen * setlocal nospell
augroup END
