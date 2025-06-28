return {
    { 'b0o/schemastore.nvim', lazy = true },

    {
        'Joakker/lua-json5',
        name = 'json5',
        lazy = false,
        build = './install.sh && cp lua/json5.dylib lua/json5.so',
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                json = { 'prettier', stop_after_first = true },
                jsonc = { 'prettier', stop_after_first = true },
                json5 = { 'prettier', stop_after_first = true },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'json-lsp',
                'prettier',
            },
        },
    },
}
