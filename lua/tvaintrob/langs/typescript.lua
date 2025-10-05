return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                javascript = { 'prettier', stop_after_first = true },
                typescript = { 'prettier', stop_after_first = true },
                javascriptreact = { 'prettier', stop_after_first = true },
                typescriptreact = { 'prettier', stop_after_first = true },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'vtsls',
                'prettierd',
                'prettier',
                'eslint-lsp',
                'js-debug-adapter',
                'chrome-debug-adapter',
            },
        },
    },
}
