local Plug = vim.fn['plug#']

vim.g.gruvbox_material_background = 'hard'

Plug('sainnhe/sonokai', {
  ['do'] = function()
    vim.g.sonokai_style='andromeda'
    vim.g.sonokai_enable_italic=1
  end
})

Plug('sainnhe/gruvbox-material', {
  ['do'] = function()
    vim.g.gruvbox_material_current_word = "grey background"
  end
})
