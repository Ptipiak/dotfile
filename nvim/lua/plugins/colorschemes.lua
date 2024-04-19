----------------------------------------------------------------------------
-- Color Themes
----------------------------------------------------------------------------

return {
  -- tokyonight
  {
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    "folke/tokyonight.nvim",
    -- load the colorscheme here
    config = function()
     vim.cmd([[colorscheme tokyonight-moon]])
    end
  },

  -- catppuccin
  {
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    name = "catppuccin",
    "catppuccin/nvim",
  },

  -- sonokai
  {
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    "sainnhe/sonokai",
    name = "sonokai",
    opts = { style = "andromeda" },
  },
  -- killer-queen
  {
    lazy = true,
    "askfiy/killer-queen",
    config = function()
      vim.cmd([[colorscheme killer-queen]])
    end,
  },
}
