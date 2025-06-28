-- Basic keymaps

-- split movements
vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true, noremap = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true, noremap = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true, noremap = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true, noremap = true })
vim.keymap.set('t', '<c-h>', '<c-\\><c-n><c-w>h', { silent = true, noremap = true })
vim.keymap.set('t', '<c-j>', '<c-\\><c-n><c-w>j', { silent = true, noremap = true })
vim.keymap.set('t', '<c-k>', '<c-\\><c-n><c-w>k', { silent = true, noremap = true })
vim.keymap.set('t', '<c-l>', '<c-\\><c-n><c-w>l', { silent = true, noremap = true })

-- yank to end of line
vim.keymap.set('n', 'Y', 'y$', { noremap = true })

-- better indenting
vim.keymap.set('v', '<', '<gv', { silent = true, noremap = true })
vim.keymap.set('v', '>', '>gv', { silent = true, noremap = true })

-- move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- disable command history
vim.keymap.set('n', 'Q', '<nop>', { noremap = true })
vim.keymap.set('n', 'q:', '<nop>', { noremap = true })

-- define keymaps when LSP is attached
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp_attach', { clear = true }),
    callback = function(ev)
        local set = vim.keymap.set
        local function with(opts)
            return vim.tbl_extend('force', { buffer = ev.buf, noremap = true }, opts)
        end

        set('n', 'gr', vim.lsp.buf.references, with({ desc = 'Show references' }))
        set('n', 'gd', vim.lsp.buf.definition, with({ desc = 'Go to definition' }))
        set('n', '<leader>rn', vim.lsp.buf.rename, with({ desc = 'Rename symbol' }))
        set(
            { 'n', 'v' },
            '<leader>ac',
            vim.lsp.buf.code_action,
            with({ desc = 'Show code actions' })
        )

        set('n', '<leader>i', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, with({ desc = 'Toggle inlay hints' }))

        set('n', '<leader>d', function()
            vim.diagnostic.open_float({ scope = 'line', border = 'single' })
        end, with({ desc = 'Show line diagnostics' }))
    end,
})
