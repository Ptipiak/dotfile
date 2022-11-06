local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Navigate PUM using tab and shift-tab
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<S-TAB>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
map("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
map("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
map("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
map("n", "gi", "<Plug>(coc-implementation)", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.CocHasProvider('hover') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('h ' .. cw)
    end
end
map("n", "K", function() show_docs() end, {silent = true})

-- Symbol renaming.
map("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code.
map("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
map("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

