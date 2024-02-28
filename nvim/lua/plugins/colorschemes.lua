----------------------------------------------------------------------------
-- Color Themes
----------------------------------------------------------------------------

return {
  -- tokyonight
  {
    name = "tokyonight",
    "folke/tokyonight.nvim",
    lazy = false,
    -- load the colorscheme here
    config = function()
     vim.cmd([[colorscheme tokyonight-moon]])
    end
  },

  -- catppuccin
  {
    name = "catppuccin",
    "catppuccin/nvim",
    lazy = true,
  },

  -- sonokai
  {
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    "sainnhe/sonokai",
    name = "sonokai",
    opts = { style = "andromeda" },
  },
}
