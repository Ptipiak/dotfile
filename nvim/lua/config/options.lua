----------------------------------------------------------------------------
-- General settings
----------------------------------------------------------------------------

vim.opt.background='dark'
vim.opt.backup = false
vim.opt.backupdir='.nvim/backup//'
vim.opt.clipboard:append('unnamedplus')
vim.opt.cmdheight=2
vim.opt.completeopt= "menu,menuone,noselect"
vim.opt.confirm = true
vim.opt.directory='.nvim/swap//'
vim.opt.expandtab = false -- convert tab to spaces
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.list = true
vim.opt.listchars={ tab='›–',eol='¬',trail='¤' }
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.redrawtime=400 -- Allow more time for loading syntax on large files
vim.opt.relativenumber = true -- line number
vim.opt.scrolloff=4
vim.opt.secure = true
vim.opt.shiftwidth=0 -- if 0 then equal tabstop
vim.opt.shortmess:append('c')
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.sidescroll = 8
vim.opt.signcolumn = "auto:1-4" -- left column sign and size
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.spell = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2 -- the length in spaces for one tab
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.updatetime = 1000 -- Reduce time for highlighting other references
vim.opt.wildmode = { longest=full,full }
vim.opt.wrap = false
vim.opt.writebackup = false


-- Optional setting for WSL distro
in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
if in_wsl then
    vim.opt.clipboard = {
        name = 'wsl clipboard',
        copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
        cache_enabled = true
    }
end
