----------------------------------------------------------------------------
-- Color Themes
-- Edit file system in the same fashion as a file buffer.
----------------------------------------------------------------------------
return {
  enabled = true,
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
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
