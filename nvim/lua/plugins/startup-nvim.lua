----------------------------------------------------------------------------
-- Color Themes
-- Edit file system in the same fashion as a file buffer.
----------------------------------------------------------------------------
return {
  'startup-nvim/startup.nvim',
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  init = function()
    require"startup".setup()
  end
}
