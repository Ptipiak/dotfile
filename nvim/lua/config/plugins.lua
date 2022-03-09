----------------------------------------------------------------------------
-- Plugins
-- To be change into lua format
----------------------------------------------------------------------------

local load = function(path)
  local loaded, _ = pcall(require, path)
  if not loaded then
    print(path, ' ', 'was not loaded')
  end
end

vim.call('plug#begin', '~/.local/share/nvim/site/autoload')
  require('plugins.colorthemes')
  -- load('~/.config/nvim/plugins/commentary.vim')
  -- load('~/.config/nvim/plugins/fugitive.vim')
  -- load('~/.config/nvim/plugins/lightline.vim')
  -- load('~/.config/nvim/plugins/surround.vim')
  -- load('~/.config/nvim/plugins/netrw.vim')
  -- load('~/.config/nvim/plugins/obession.vim')
vim.call('plug#end')

