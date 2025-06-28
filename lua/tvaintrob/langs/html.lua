return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                css = { 'prettierd', 'prettier', stop_after_first = true },
                html = { 'prettierd', 'prettier', stop_after_first = true },
                htmlangular = { 'prettierd', 'prettier', stop_after_first = true },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'css-lsp',
                'html-lsp',
                'tailwindcss-language-server',
                'prettierd',
                'prettier',
            },
        },
    },
}
