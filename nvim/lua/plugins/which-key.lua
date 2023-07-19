----------------------------------------------------------------------------
-- Which key
----------------------------------------------------------------------------
return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
    })
    require("which-key").register({
      ["<leader>"] = {
        name = "leader",
        ff = "Find file",
        fb = "Find buffer",
        rg = "Rip Grep within files",
        ce = "Edit config file",
        cs = "Reload the congfig",
        ul = "Toggle line numbering"
      },
    })
  end,
}
