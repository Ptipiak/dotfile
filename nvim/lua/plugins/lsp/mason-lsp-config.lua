return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim"
  },
  config = function(_, otps)
    mason_lspconfig = require("mason-lspconfig")

    local opts = {
      on_attach = require("plugins.lsp.lsp-config").on_attach,
      capabilities = require("plugins.lsp.lsp-config").capabilities,
    }

    local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status_ok then
      vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
      return
    end

    mason_lspconfig.setup_handlers({
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- Default handler (optional)
        lspconfig[server_name].setup {
          on_attach = opts.on_attach,
          capabilities = opts.capabilities,
        }
      end
    })

  end
}
