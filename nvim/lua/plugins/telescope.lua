local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
local telescope = require('telescope')
local actions = require("telescope.actions")
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = actions.select_horizontal,
      },
      n = {
        ["<C-s>"] = actions.select_horizontal,
      },
    },
  },
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
telescope.load_extension('fzf')


-- Mapping for the plugin
local builtin = require("telescope.builtin")
map('n', '<leader>f', function() builtin.find_files() end)
map('n', '<leader>b', function() builtin.buffers() end)
map('n', '<leader>c', function() builtin.commands() end)
