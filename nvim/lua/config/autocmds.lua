----------------------------------------------------------------------------
-- Automatic Commands
----------------------------------------------------------------------------

-- Make the terminal emulator look better
terminal_group = vim.api.nvim_create_augroup("terminal", {})
vim.api.nvim_create_autocmd("TermEnter", {
  desc = "Make terminal emulator look like a terminal",
  group = terminal_group,
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, -2, -1, true)
    -- length(lines)
    vim.api.nvim_win_set_cursor(0, { 4, 1 })
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.scrolloff=0
    vim.wo.signcolumn = "auto" -- left column sign and size
    vim.wo.wrap = true
  end
});
vim.api.nvim_create_autocmd("TermLeave", {
  desc = "Make terminal emulator look like a terminal",
  group = terminal_group,
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.wo.scrolloff=4
    vim.wo.signcolumn = "auto:1-4" -- left column sign and size
    vim.wo.wrap = false
  end
});

-- user_group = vim.api.nvim_create_augroup("user-enter", {})
-- vim.api.nvim_create_autocmd("VimEnter", {
--   desc = "Get the parent directory of the first opened file and set it as working directory",
--   group = user_group,
--   callback = function()
--     local path = require('plenary.path')
--     local file_path = vim.api.nvim_buf_get_name(0)
--     vim.notify(file_path)
--     local parent_directory = path.new(file_path)
--   end
-- });
