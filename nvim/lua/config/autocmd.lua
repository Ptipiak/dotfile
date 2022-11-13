----------------------------------------------------------------------------
-- Automatic commands
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

-- Reload the configuration every time one of the files is written.
config_group = vim.api.nvim_create_augroup("configuration", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  desc="Reload the lua config files on change",
  group = config_group,
  pattern = {home .. "*.lua"},
  callback = ReloadConfig
});

-- Highlight the symbol and its references when holding the cursor.
-- file_type_group = vim.api.nvim_create_augroup("filetype", {})
-- coc_group = vim.api.nvim_create_augroup("CocGroup", {})
-- vim.api.nvim_create_autocmd("CursorHoldI", {
--     desc = "Highlight symbol under cursor on CursorHold",
--     group = coc_group, 
--     callback = function(event)
--       local cw = vim.fn.expand('<cexpr>')
--       if vim.fn.CocHasProvider('hover') then
--         vim.lsp.buf.hover(cw)
--       end
--     end,
-- })
