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
        config = function()
            require('schema-companion').setup({
                enable_telescope = true,
                matchers = {
                    -- add your matchers
                    require('schema-companion.matchers.kubernetes').setup({ version = 'master' }),
                },
                schemas = {
                    {
                        name = 'Kubernetes master',
                        uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json',
                    },
                    {
                        name = 'Kubernetes v1.27',
                        uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.27.16-standalone-strict/all.json',
                    },
                    {
                        name = 'Kubernetes v1.28',
                        uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.12-standalone-strict/all.json',
                    },
                    {
                        name = 'Kubernetes v1.29',
                        uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.7-standalone-strict/all.json',
                    },
                    {
                        name = 'Kubernetes v1.30',
                        uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.3-standalone-strict/all.json',
                    },
                },
            })
        end,
    },
}
