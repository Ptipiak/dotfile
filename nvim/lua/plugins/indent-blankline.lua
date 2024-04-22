----------------------------------------------------------------------------
-- indent-blankline better folding and indentation
----------------------------------------------------------------------------
-- It as a tendency to not behave correctly with the default nvim presentation screen,
-- most likely came from a `cmd` or a random command execution which take over the UI.
return {
  enabled = true,
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    indent = {
      char = "▏", -- Thiner, not suitable when enable scope
      tab_char = "▏",
    },
    scope = {
      -- Rely on treesitter, bad performance
      enabled = false,
      -- highlight = highlight,
    },
  },
  config = function(_, opts)
    local ibl = require("ibl")
    local hooks = require("ibl.hooks")

    ibl.setup(opts)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- Hide first level indent, using `foldsep` to show it
    hooks.register(hooks.type.VIRTUAL_TEXT, function(_, _, _, virt_text)
      if virt_text[1] and virt_text[1][1] == opts.indent.char then
        virt_text[1] = { " ", { "@ibl.whitespace.char.1" } }
      end
      return virt_text
    end)
  end,
}
