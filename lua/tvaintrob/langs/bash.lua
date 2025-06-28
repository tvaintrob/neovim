return {
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'shfmt',
                'bash-language-server',
            },
        },
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                sh = { 'shfmt' },
            },
        },
    },
}
