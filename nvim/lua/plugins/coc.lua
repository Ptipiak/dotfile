local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end 

local expr_opts = { noremap = true, silent = true, expr = true }
local opts = { noremap = true, silent = true }

-- use CR to complete
map(
    "i",
    "<CR>",
    [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    expr_opts
)

-- use <c-space> to trigger completion.
map("i", "<c-space>", [[coc#refresh()]], expr_opts)

-- Navigate PUM using tab and shift-tab
map('i', '<tab>', [[coc#pum#visible() ? coc#pum#next(1) : coc#jumpable() ? "\<tab>=coc#rpc#request('snippetNext', [])<cr>" : "\<tab>"]], {silent= true, expr = true})
map('i', '<S-tab>', [[coc#pum#visible() ? coc#pum#prev(1) : coc#jumpable() ? "\<S-tab>=coc#rpc#request('snippetPrevious', [])<cr>" : "\<S-tab>"]], {silent= true, expr = true}) 

-- use <c-space> to trigger completion.
map("i", "<c-space>", [[coc#refresh()]], expr_opts)

-- navigate diagnostic
map("n", "[a", "<Plug>(coc-diagnostic-prev)", { silent = true })
map("n", "]a", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)", { silent = true })
map("n", "gs", ":call CocAction('jumpDefinition', 'vsplit') <CR>", { silent = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true })

-- highlight
-- for custom pop menu
vim.highlight.create("CocCustomPopup", { guifg = "#ebdbb2", guibg = "#282828" })
-- border
vim.highlight.create("CocCustomPopupBoder", { guifg = "#5F5F5F", gui = "bold" })
-- selected row
vim.highlight.create("CocMenuSel", { guibg = "#3c3836", gui = "bold" })
-- matched_text
vim.highlight.create("CocSearch", { guifg = "#fabd2f" })

-- Use K to show documentation in preview window.
function Show_documentation()
    local filetype = vim.bo.filetype
    if filetype == "vim" or filetype == "help" then
        vim.api.nvim_command("h " .. vim.fn.expand("<cword>"))
    elseif vim.fn["coc#rpc#ready"]() then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_command(
            "!" .. vim.bo.keywordprg .. " " .. vim.fn.expand("<cword>")
        )
    end
end

map("n", "K", ":lua Show_documentation() <CR>", opts)

-- Symbol renaming.
map("n", "<leader>rn", "<Plug>(coc-rename)", {})

-- " Formatting selected code. Followed by highlighted code
map("x", "<leader>f", "<Plug>(coc-format-selected)", {})

-- " Mappings for CoCList
-- " Show all diagnostics (Errors and warnings).
map("n", "<leader>a", ":<C-u>CocList diagnostics<CR>", opts)
-- " Find symbol of current document
map("n", "<leader>o", ":<C-u>CocList outline<CR>", opts)

-- HAVNE'T FOUND A GOOD USE-CASE YET
-- " Applying codeAction to the selected region.
-- " Example: `<leader>aap` for current paragraph
-- xmap <leader>a  <Plug>(coc-codeaction-selected)
-- nmap <leader>a  <Plug>(coc-codeaction-selected)

-- " Remap keys for applying codeAction to the current buffer.
-- nmap <leader>ac  <Plug>(coc-codeaction)
-- " Apply AutoFix to problem on the current line.
-- " NOTE: haven't found a use case for it yet. makes quit shortcut wait.
-- " Therefore disabling it for now
-- " nmap <leader>qf  <Plug>(coc-fix-current)


-- Commands
-- " Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", ":call CocAction('format')", { nargs = 0 })

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OI", ":call CocActionAsync('runCommand', 'editor.action.organizeImport')",
    { nargs = 0 })
