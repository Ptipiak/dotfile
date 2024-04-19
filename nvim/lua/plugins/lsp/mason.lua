return {
    lazy = false,
    priority = 10,
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "shfmt",
        "json-fmt",
      },
    }
}
