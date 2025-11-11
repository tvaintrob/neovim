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

-- open opencode in tmux pane
vim.keymap.set('n', '<leader><cr>', function()
    -- check if a pane with opencode title exists
    local panes = vim.fn.system(
        'tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index} #{pane_title}"'
    )
    local opencode_pane = panes:match('([^%s]+)%s+opencode')

    if opencode_pane then
        -- switch to existing opencode pane
        vim.fn.system('tmux switch-client -t ' .. opencode_pane)
        vim.fn.system('tmux select-pane -t ' .. opencode_pane)
    else
        local command
        for _, candidate in ipairs({ 'opencode', 'open-opencode', 'cursor open opencode' }) do
            local executable = candidate:match('^([^%s]+)')
            if executable and vim.fn.executable(executable) == 1 then
                command = candidate
                break
            end
        end
        command = command or 'opencode'

        -- create new pane with opencode and set title
        vim.fn.system(
            string.format('tmux split-window -h -l 100 %s', vim.fn.shellescape(command))
        )
        vim.fn.system('tmux select-pane -T "opencode"')
    end
end, { noremap = true, silent = true, desc = 'Open OpenCode in tmux pane' })

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
        set('n', 'gD', function()
            vim.cmd('vsplit')
            vim.lsp.buf.definition()
        end, with({ desc = 'Go to definition in vertical split' }))
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

        set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'rounded' })
        end, { desc = 'Hover Documentation' })
    end,
})
