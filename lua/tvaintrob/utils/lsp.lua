local M = {}

function M.setup_server(server_name, opts)
    opts = opts or {}
    opts.capabilities = require('blink.cmp').get_lsp_capabilities(opts.capabilities)
    require('lspconfig')[server_name].setup(opts)
end

---Setup key bindings for when an LSP is active
---@param _ any
---@param buffer any
function M.lsp_keymaps(_, buffer)
    local set = vim.keymap.set
    local function with(opts)
        return vim.tbl_extend('force', { buffer = buffer, noremap = true }, opts)
    end

    set('n', 'gr', vim.lsp.buf.references, with({ desc = 'Show references' }))
    set('n', 'gd', vim.lsp.buf.definition, with({ desc = 'Go to definition' }))
    set('n', '<leader>rn', vim.lsp.buf.rename, with({ desc = 'Rename symbol' }))
    set({ 'n', 'v' }, '<leader>ac', vim.lsp.buf.code_action, with({ desc = 'Show code actions' }))

    set('n', '<leader>i', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, with({ desc = 'Toggle inlay hints' }))

    set('n', '<leader>d', function()
        vim.diagnostic.open_float({ scope = 'line', border = 'single' })
    end, with({ desc = 'Show line diagnostics' }))
end

return M
