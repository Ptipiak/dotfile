----------------------------------------------------------------------------
-- Mason lsp binding
----------------------------------------------------------------------------
return {
  enabled = true,
  lazy = false,
  priority = 80,
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
  },
  opts = {
    capabilites = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "icon",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
      },
      -- Automatically format on save
      autoformat = true,
      -- Enable this to show formatters used in a notification
      -- Useful for debugging formatter issues
      format_notify = true,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
  },
  config = function(_, opts)
    vim.lsp.set_log_level("debug")
    vim.diagnostic.config(opts.diagnostics)
    vim.lsp.buf.format(opts.format)
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local coq = require('coq')
    mason_lspconfig.setup_handlers({
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- Default handler (optional)
        lspconfig[server_name].setup({
          capabilites = coq.lsp_ensure_capabilities(opts.capabilites) 
        })
      end,
    })
  end
}
