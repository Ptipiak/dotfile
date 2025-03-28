----------------------------------------------------------------------------
-- Mason
----------------------------------------------------------------------------
return {
  enabled = true,
  lazy = false,
  priority = 30,
  "williamboman/mason.nvim",
  opts = {
    log_level = vim.log.levels.INFO,
    ensure_installed = {
      "lua-language-server"
    },
  },
}
