----------------------------------------------------------------------------
-- Utils
-- To be change into lua format
----------------------------------------------------------------------------

-- augroup FileTypeOverrides
-- 	" autocmd FileType yaml setlocal tabstop=4 softtabstop=2 shiftwidth=2 smartindent noexpandtab
-- 	autocmd TermOpen * setlocal nospell
-- augroup END

-- -- Allow to use yanking and filling up the windows clipboard
-- if system('uname -r') =~ "Microsoft"
--   augroup Yank
--     autocmd!
--     autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe', @")
--     augroup END
-- endif

function _G.ReloadConfig()
    local hls_status = vim.v.hlsearch
    for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
    if hls_status == 0 then
        vim.opt.hlsearch = false
    end
end
