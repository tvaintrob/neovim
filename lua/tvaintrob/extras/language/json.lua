return {
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
                'prettierd',
                'prettier',
            },
        },
    },

    { 'b0o/schemastore.nvim', lazy = true },

    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = {
                ['jsonls'] = function()
                    require('tvaintrob.utils.lsp').setup_server('jsonls', {
                        settings = {
                            json = {
                                schemas = require('schemastore').json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    })
                end,
            },
        },
    },
}
