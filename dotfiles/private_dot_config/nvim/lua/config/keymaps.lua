----------------------------------------------------------------------------
-- Key maps
----------------------------------------------------------------------------

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

--- Display diagnostic messages in a floating window
map('n', '<leader>d',
function() vim.diagnostic.open_float({ border = "single" }) end,
{ desc = "Display diagnostic message in a floating window" })

-- --- TEST ZONE START
-- -- A little function to switch how to show diagnostics
-- map('n', '<leader>di',
-- function()
--   if not vim.diagnostic.config().virtual_lines then
--     vim.diagnostic.config({ virtual_lines = { current_line = true } })
--   else
--     vim.diagnostic.config({ virtual_lines = true })
--   end
-- end
-- , { desc = 'Toggle showing all diagnostics or just current line' })
-- --- TEST ZONE END

-- Toggle lines numbering
map('n', '<leader>ul',
function()
  if vim.o.nu then
    vim.opt.number = false
    vim.opt.relativenumber = false
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
  end
end, { desc = 'Toggle the line numbering' })


-- To map <Esc> to exit terminal-mode
map('t', '<Esc>', '<C-\\><C-n>')

map('t', '<C-w>h', '<C-\\><C-n><C-w>h')
map('t', '<C-w>l', '<C-\\><C-n><C-w>l')
map('t', '<C-w>j', '<C-\\><C-n><C-w>j')
map('t', '<C-w>k', '<C-\\><C-n><C-w>k')
