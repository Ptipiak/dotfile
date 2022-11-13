local actions = require("telescope.actions")
local telescope = require('telescope')
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
telescope.setup {
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    },
    mappings = {
      i = {
        ["<C-s>"] = actions.select_horizontal,
      },
      n = {
        ["<C-s>"] = actions.select_horizontal,
      },
    },
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }, 
    file_browser = {
      initial_mode = "normal",
      -- on_complete = function(picker)
      --   print("Pouetx2")
      -- end,
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      -- hijack_netrw = true,
    },
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
telescope.load_extension "file_browser"


-- Mapping for the plugin
local builtin = require("telescope.builtin")
map('n', '<leader>f', builtin.find_files)
map('n', '<leader>b', builtin.buffers)
map('n', '<leader>c', builtin.commands)
map('n', '<leader>rg', builtin.live_grep)


-- Mapping for the plugin extension telescope file browser
-- map('c', 'E<Cr>', 
--     function()
--       telescope.extensions.file_browser.file_browser() 
--     end,
--     { remap = true })
