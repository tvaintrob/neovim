return {
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'gopls',
                'goimports',
            },
        },
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                go = { 'goimports' },
            },
        },
    },
}
