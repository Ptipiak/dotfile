-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local options = { noremap=true, silent=true }
map('n', '<leader>e', vim.diagnostic.open_float, options)
map('n', '<leader>dp', vim.diagnostic.goto_prev, options)
map('n', '<leader>dn', vim.diagnostic.goto_next, options)
map('n', '<leader>q', vim.diagnostic.setloclist, options)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local options = { noremap=true, silent=true, buffer=bufnr }
  map('n', '<leader>gD', vim.lsp.buf.declaration, options)
  map('n', '<leader>gd', vim.lsp.buf.definition, options)
  map('n', '<leader>K', function(event)
      vim.lsp.buf.hover(vim.fn.expand('<cexpr>'))
    end,
    options)
  map('n', '<leader>gi', vim.lsp.buf.implementation, options)
  map('n', '<C-k>', vim.lsp.buf.signature_help, options)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, options)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, options)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, options)
  map('n', '<leader>D', vim.lsp.buf.type_definition, options)
  map('n', '<leader>rn', vim.lsp.buf.rename, options)
  map('n', '<leader>ca', vim.lsp.buf.code_action, options)
  map('n', 'gr', vim.lsp.buf.references, options)
  -- map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
