----------------------------------------------------------------------------
-- Color Themes
----------------------------------------------------------------------------
return {
  -- tokyonight
  {
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function ()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },
  -- catppuccin
  {
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      vim.cmd("colorscheme catppuccin-mocha")
    end
  },
  -- sonokai
  {
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    "sainnhe/sonokai",
    name = "sonokai",
    opts = { style = "andromeda" },
    config = function ()
      vim.cmd([[colorscheme sonokai]])
    end
  },
  -- killer-queen
  {
    lazy = true,
    "askfiy/killer-queen",
    name = "killer-queen",
    config = function ()
      vim.cmd([[colorscheme killer-queen]])
    end
  },
  -- cyberdream
  {
    lazy = true,
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })
    end,
  },
}
