----------------------------------------------------------------------------
-- Telescope
----------------------------------------------------------------------------
return {
  lazy = false,
  "nvim-telescope/telescope.nvim", 
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  init = function()
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
        }
      }
    }

    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    telescope.load_extension('fzf')
    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    -- telescope.load_extension "file_browser"


    -- Mapping for the plugin
    local builtin = require("telescope.builtin")
    map('n', '<leader>ff', builtin.find_files)
    map('n', '<leader>fb', builtin.buffers)
    map('n', '<leader>rg', builtin.live_grep, { remap = true })
  end
}
