----------------------------------------------------------------------------
-- Utils
-- To be change into lua format
----------------------------------------------------------------------------

augroup FileTypeOverrides
	" autocmd FileType yaml setlocal tabstop=4 softtabstop=2 shiftwidth=2 smartindent noexpandtab
	autocmd TermOpen * setlocal nospell
augroup END

-- Allow to use yanking and filling up the windows clipboard
if system('uname -r') =~ "Microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe', @")
    augroup END
endif

