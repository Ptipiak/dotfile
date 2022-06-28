local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


map('n', '<leader>f', ':Telescope find_files<cr>')
map('n', '<leader>b', ':Telescope buffers<cr>')

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = actions.select_horizontal,
      },
      n = {
        ["<C-s>"] = actions.select_horizontal,
      },
    },
  }
}
