return {
  enabled = true,
  lazy = false,
  priority = 20,
  'ms-jpq/coq_nvim',
  branch = 'coq',
  name = 'coq',
  opts =  {
    display = {
      pum = {
        fast_close = false
      }
    },
    args = {
      "--shut-up"
    }
  },
  config = function(_, opts)
    local coq = require('coq')
    coq.Now(unpack(opts.args))
    vim.g.coq_settings = unpack(opts.display)
  end
}
