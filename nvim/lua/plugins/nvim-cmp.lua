return {
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function(_, opts)
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('snippy').expand_snippet(args.body) -- For `snippy` users.
        end,
      },
      window = {
--        completion = cmp.config.window.bordered(),
--        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })

    local opts = {
      on_attach = require("plugins.lsp.lsp-config").on_attach,
      capabilities = require("plugins.lsp.lsp-config").capabilities,
    }

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['lua_ls'].setup {
      capabilities = opts.capabilities
    }
  end
}
