----------------------------------------------------------------------------
-- Telescope
----------------------------------------------------------------------------
return {
  enable = true,
  lazy = false,
  "nvim-telescope/telescope.nvim", 
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find within files",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find within buffers",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Find using grep",
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").marks()
      end,
      desc = "Find marks",
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        layout_config = {
          vertical = { width = 0.5 }
        },
        file_ignore_patterns = { 
          "node_modules",
          "venv"
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
        marks = {
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
  end,
  config = function(_, opts)
    local actions = require("telescope.actions")
    local telescope = require('telescope')
    -- You dont need to set any of these options. These are the default ones. Only
    -- the loading is important
    telescope.setup(opts)
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    telescope.load_extension('fzf')
  end
}
