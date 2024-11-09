----------------------------------------------------------------------------
-- Oil file system
-- Edit file system in the same fashion as a file buffer.
----------------------------------------------------------------------------
return {
  enable = true,
  lazy = false,
  'stevearc/oil.nvim',
  opts = {
    columns = {
      "icon",
      -- "permissions",
      "size",
      -- "mtime",
    },
    skip_confirm_for_simple_edits = false,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    delete_to_trash = true,
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require('oil').setup(opts)
  end
}
