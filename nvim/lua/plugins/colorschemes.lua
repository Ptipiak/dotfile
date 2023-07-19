----------------------------------------------------------------------------
-- Color Themes
----------------------------------------------------------------------------

return {

  -- tokyonight
  {
    name = "tokyonight",
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    name = "catppuccin",
    "catppuccin/nvim",
    lazy = true,
  },

  -- sonokai
  {
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    "sainnhe/sonokai",
    name = "sonokai",
    opts = { style = "andromeda" },
    -- load the colorscheme here
    config = function()
      vim.cmd([[colorscheme sonokai]])
    end
  }
}
