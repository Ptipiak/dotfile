return {
    lazy = false,
    "williamboman/mason.nvim",
    priority = 20,
    opts = {
      ensure_installed = {
        "lua_ls",
        "shfmt",
        "json-fmt",
      },
    }
}
