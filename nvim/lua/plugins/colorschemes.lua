----------------------------------------------------------------------------
-- Color Themes
----------------------------------------------------------------------------
return {
  --
  -- tokyonight
  --
  {
    lazy = true, -- make to disable/enable this during startup if it is your main colorscheme
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function ()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },
  --
  -- catppuccin
  --
  {
    lazy = true,
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      vim.cmd("colorscheme catppuccin-mocha")
    end
  },
  --
  -- sonokai
  -- This color scheme is based on Monokai Pro, the contrast is adjusted to be a bit lower while keeping the colors vivid enough.
  {
    lazy = true,
    "sainnhe/sonokai",
    name = "sonokai",
    opts = { style = "andromeda" },
    config = function ()
      vim.cmd([[colorscheme sonokai]])
    end
  },
  --
  -- killer-queen
  --
  {
    lazy = false,
    "askfiy/killer-queen",
    name = "killer-queen",
    config = function ()
      vim.cmd([[colorscheme killer-queen]])
    end
  },
  --
  -- cyberdream
  --
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
  --
  -- oxocarbon
  --
  {
    lazy = true,
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
    config = function (_, opts)
      vim.cmd([[colorscheme oxocarbon]])
      local folded = vim.api.nvim_get_hl(0,{name = "Folded"})
      local comment = vim.api.nvim_get_hl(0,{name = "Comment"})
      local diffdelete = vim.api.nvim_get_hl(0,{name = "DiffDelete"})
      local alpha = vim.tbl_extend('force', diffdelete, {
        fg=comment.fg,
      })
      vim.api.nvim_set_hl(0, 'DiffDelete', alpha)
    end
  }
}
