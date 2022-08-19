----------------------------------------------------------------------------
-- Key maps
-- To be change into lua format
----------------------------------------------------------------------------

vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local wrap = function(func, ...)
  local args = {...}
    return function()
      func(unpack(args))
  end
end

map('n', '<leader>ve', ':edit ~/.config/nvim/<cr>')
map('n', '<leader>vs', ':luafile ~/.config/nvim/init.lua<cr>')

map('n', '<leader>k', ':nohls<cr>')
map('n', '<leader>gf', ':edit <cfile><cr>')

-- Allow gf to open non-existent files
-- map gf :edit <cfile><cr>

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

-- Copy to system clippboard
-- map('n', "<leader>y", '"+y')
-- map('v', "<leader>y", '"+y')

-- Paste from system clippboard
-- map('n', "<leader><C-v>", '"+p')
-- map('v', "<leader><C-v>", '"+p')

-- map('n', 'k', example, { silent = true})

-- Paste replace visual selection without copying it
-- vnoremap <leader>p "_dP

-- Make Y behave like the other capitals
-- nnoremap Y y$

-- Keep it centered
-- nnoremap n nzzzv
-- nnoremap N Nzzzv
-- nnoremap J mzJ`z

-- Open the current file in the default program (not working on WSL obvi)
-- nmap <leader>x :!xdg-open %<cr><cr>

-- Quicky escape to normal mode
-- imap jj <esc>

-- Easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<esc>A;<esc>')
map('i', ',,', '<esc>A,<esc>')

-- Allows writing to files with root priviledges
-- cmap w!! w !sudo tee % > /dev/null

-- nmap <leader>nu :set number! relativenumber!<CR>
map('n', '<leader>nu', function() vim.opt.number = not vim.opt.number end)

-- Resize the windows more efficiently

-- inoremap <leader>+ :vertical resize +5<CR>
-- inoremap <leader>- :vertical resize -5<CR>

-- Optional key map for WSL distro
in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
if in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
        cache_enabled = true
    }
end
