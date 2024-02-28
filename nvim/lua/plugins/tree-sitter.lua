----------------------------------------------------------------------------
-- Treesitter
----------------------------------------------------------------------------
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  tag = "v0.9.1",
  build = ":TSUpdate",
  cmd = { "TSUpdateSync" },
  opts = {
    highlight = {
      enable = true ,
      disable = function(lang, buf)
          local max_filesize = 1000 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,
    },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
