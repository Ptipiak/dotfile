----------------------------------------------------------------------------
-- Automatic Commands
----------------------------------------------------------------------------

-- Make the terminal emulator look better
terminal_group = vim.api.nvim_create_augroup("terminal", {})
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Make terminal emulator look like a terminal",
  group = terminal_group,
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, -2, -1, true)
    -- length(lines)
    vim.api.nvim_win_set_cursor(0, { 4, 1 })
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff=0
    vim.opt_local.signcolumn = "auto" -- left column sign and size
    vim.opt_local.wrap = true
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
