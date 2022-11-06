----------------------------------------------------------------------------
-- Plugins
----------------------------------------------------------------------------

require('packer').startup(function()

-- Packer can manage itself
use 'wbthomason/packer.nvim'
-- Plenetary compilation of useful lua functions
use "nvim-lua/plenary.nvim"
use "neovim/nvim-lspconfig"
-- Color themes
use "sainnhe/sonokai"
use "sainnhe/gruvbox-material"
-- Coc nvim
use {"neoclide/coc.nvim", branch="release"}
-- Useful Tpope plugins
use "tpope/vim-commentary"
use "tpope/vim-fugitive"
-- Telescope
use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'}}}
use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make' }
end)

load('plugins.colorthemes')
load('plugins.coc')
load('plugins.commentary')
load('plugins.telescope')

-- load('~/.config/nvim/plugins/lightline.vim')
-- load('~/.config/nvim/plugins/surround.vim')
-- load('~/.config/nvim/plugins/netrw.vim')
-- load('~/.config/nvim/plugins/obession.vim')
