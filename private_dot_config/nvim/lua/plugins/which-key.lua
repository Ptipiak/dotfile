----------------------------------------------------------------------------
-- Which key
----------------------------------------------------------------------------
return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    ["<leader>"] = {
      ce = "Edit config file",
      cs = "Reload the congfig",
      ul = "Toggle line numbering"
    },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup(opts)
  end,
}
