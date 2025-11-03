return {
    { 'b0o/schemastore.nvim', lazy = true },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                yaml = { 'prettierd', 'prettier', stop_after_first = true },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'yaml-language-server',
                'prettierd',
                'prettier',
            },
        },
    },

    {
        'cenk1cenk2/schema-companion.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope.nvim' },
        },
        opts = {},
    },
}
