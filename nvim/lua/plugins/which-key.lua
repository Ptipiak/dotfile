----------------------------------------------------------------------------
-- Which key
----------------------------------------------------------------------------
return {
  "folke/which-key.nvim",
  opts = {
      ["<leader>"] = {
        name = "leader",
        ce = "Edit config file",
        cs = "Reload the congfig",
        ul = "Toggle line numbering"
      },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
    })
    require("which-key").register({
      opts
    })
  end,
}
