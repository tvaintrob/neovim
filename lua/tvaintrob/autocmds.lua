local function augroup(name)
    return vim.api.nvim_create_augroup('personal_' .. name, { clear = true })
end

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('checktime'),
    callback = function()
        if vim.o.buftype ~= 'nofile' then
            vim.cmd('checktime')
        end
    end,
})

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup('highlight_yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd('VimResized', {
    group = augroup('resize_splits'),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        if vim.wo.wrap ~= false then
            vim.opt_local.wrap = true
        end
        if vim.wo.spell ~= false then
            vim.opt_local.spell = true
        end
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = augroup('lsp_attach'),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        require('workspace-diagnostics').populate_workspace_diagnostics(client, ev.buf)
        require('tvaintrob.utils.lsp').lsp_keymaps(ev.buf)
    end,
})

vim.api.nvim_create_autocmd('BufEnter', {
    group = augroup('win_enter'),
    callback = function()
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.HINT] = '󰌵',
                    [vim.diagnostic.severity.WARN] = ' ',
                    [vim.diagnostic.severity.INFO] = ' ',
                    [vim.diagnostic.severity.ERROR] = ' ',
                },
            },
        })
    end,
})
