return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "json-fmt",
      },
    }
}
