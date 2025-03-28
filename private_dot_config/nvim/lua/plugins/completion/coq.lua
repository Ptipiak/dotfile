----------------------------------------------------------------------------
-- Coq
----------------------------------------------------------------------------
return {
  enabled = true,
  'ms-jpq/coq_nvim',
  event = {"VeryLazy"},
  branch = 'coq',
  name = 'coq',
  opts =  {
    display = {
      preview = {
        resolve_timeout = 0.40,
        positions = { east= 1, north= 2, south= 3, west= 4 },
        border = "double"
      },
      pum = {
        fast_close = false,
      },
      icons = {
        mode = "short",
      },
    },
   -- keymap = {
   --   eval_snips = '<leader>j'
   -- },
  },
  config = function(_, opts)
    local coq = require('coq')
    coq.Now("--shut-up")
    vim.g.coq_settings = opts
  end
}
