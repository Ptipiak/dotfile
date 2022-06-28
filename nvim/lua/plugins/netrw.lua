let g:netrw_keepdir = 1
let g:netrw_winsize = 50
let g:netrw_banner = 0
let g:netrw_hide = 1

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>

  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <Leader><TAB> mu
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
