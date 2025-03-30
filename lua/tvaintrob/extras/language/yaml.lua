return {
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

    { 'b0o/schemastore.nvim', lazy = true },
    { 'someone-stole-my-name/yaml-companion.nvim', lazy = true },

    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = {
                ['yamlls'] = function()
                    local yaml_config = require('yaml-companion').setup({
                        lspconfig = {
                            settings = {
                                yaml = {
                                    schemaStore = {
                                        enable = false,
                                        url = '',
                                    },
                                    schemas = require('schemastore').yaml.schemas({
                                        extra = {
                                            {
                                                name = 'Taskfile.yaml',
                                                url = 'https://taskfile.dev/schema.json',
                                                fileMatch = { 'taskfile.yml', 'taskfile.yaml' },
                                                description = 'Taskfile schema',
                                            },
                                        },
                                    }),
                                },
                            },
                        },
                    })

                    require('tvaintrob.utils.lsp').setup_server('yamlls', yaml_config)
                end,
            },
        },
    },
}
