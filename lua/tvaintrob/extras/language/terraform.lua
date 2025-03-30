return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                terraform = { 'terraform_fmt' },
                tf = { 'terraform_fmt' },
                ['terraform-vars'] = { 'terraform_fmt' },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'terraform-ls',
            },
        },
    },
}
