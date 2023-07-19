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
    vim.api.nvim_win_set_cursor(0, { 4, 1 })
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.scrolloff=0
    vim.wo.signcolumn = "auto" -- left column sign and size
    vim.wo.wrap = true
  end
});
