return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                javascript = { 'biome-check', 'prettier', stop_after_first = true },
                typescript = { 'biome-check', 'prettier', stop_after_first = true },
                javascriptreact = { 'biome-check', 'prettier', stop_after_first = true },
                typescriptreact = { 'biome-check', 'prettier', stop_after_first = true },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'vtsls',
                'biome',
                'prettierd',
                'prettier',
                'eslint-lsp',
                'js-debug-adapter',
                'chrome-debug-adapter',
            },
        },
    },
}
