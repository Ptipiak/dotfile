----------------------------------------------------------------------------
-- Notify
----------------------------------------------------------------------------
return {
  enabled = true,
  "rcarriga/nvim-notify",
  lazy = false,
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Remove all Notifications",
    },
  },
  opts = {
    timeout = 1200,
    max_height = function()
      return math.floor(vim.o.lines * 0.25)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
  config = function(_, opts)
    local notify = require('notify')
    notify.setup(opts)
    -- when noice is not enabled, install notify on VeryLazy
    local Util = require("lazyvim.util")
    -- if not Util.has("noice.nvim") then
     Util.on_very_lazy(function()
       vim.notify = notify
     end)
    -- end
  end,
}
