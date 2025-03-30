return {
    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'ruff',
                'pyright',
                'debugpy',
            },
        },
    },

    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = {
                ['pyright'] = function()
                    require('tvaintrob.utils.lsp').setup_server('pyright', {})
                end,
            },
        },
    },

    {
        'mfussenegger/nvim-dap-python',
        ft = { 'python' },
        config = function()
            local debugpy_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'
            require('dap-python').setup(debugpy_path)
        end,
    },
}
