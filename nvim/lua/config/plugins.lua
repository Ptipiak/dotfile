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

require('packer').startup(function()

use "neovim/nvim-lspconfig"
use "sainnhe/sonokai"
use {"neoclide/coc.nvim", branch="release"}
use "tpope/vim-commentary"
use "tpope/vim-fugitive"
-- telescope
use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'}}}
use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make' }

-- load('~/.config/nvim/plugins/lightline.vim')
-- load('~/.config/nvim/plugins/surround.vim')
-- load('~/.config/nvim/plugins/netrw.vim')
-- load('~/.config/nvim/plugins/obession.vim')
end)

load('plugins.colorthemes')
load('plugins.coc')
load('plugins.commentary')
load('plugins.telescope')
