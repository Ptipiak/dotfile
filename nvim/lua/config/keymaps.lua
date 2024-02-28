----------------------------------------------------------------------------
-- Key maps
----------------------------------------------------------------------------

local home = os.getenv('HOME') .. '/'

vim.g.mapleader = ' '

map('n', '<leader>ce', ':cd ~/.config/nvim/<cr>')
map('n', '<leader>cs', ReloadConfig)

map('n', '<leader>h', ':nohls<cr>')

-- Quicker switching between windows
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
map('v', 'y', 'ygvh<esc>')
map('v', 'Y', 'Ygvh<esc>')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Easy insertion of a trailing ; or , from insert mode
-- map('i', ';;', '<esc>A;<esc>')
-- map('i', ',,', '<esc>A,<esc>')

-- Allows writing to files with root priviledges
-- cmap w!! w !sudo tee % > /dev/null

-- nmap <leader>nu :set number! relativenumber!<CR>
map('n', '<leader>ul', 
function() 
  if vim.o.nu then
    vim.opt.number = false
    vim.opt.relativenumber = false
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
  end
end)


-- To map <Esc> to exit terminal-mode
map('t', '<Esc>', '<C-\\><C-n>')
