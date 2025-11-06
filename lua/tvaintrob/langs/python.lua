return {
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'tombi', -- for pyproject.toml
                'ruff',
                'pyright',
                'debugpy',
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
