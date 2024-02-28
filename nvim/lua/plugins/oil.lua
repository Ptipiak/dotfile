----------------------------------------------------------------------------
-- Color Themes
-- Edit file system in the same fashion as a file buffer.
----------------------------------------------------------------------------
return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require('oil').setup({
      columns = {
        -- "icon",
        -- "permissions",
        "size",
        -- "mtime",
      },
      skip_confirm_for_simple_edits = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
  end
}
