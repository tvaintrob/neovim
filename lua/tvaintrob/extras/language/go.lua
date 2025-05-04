return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                go = { 'goimports', 'gofmt', stop_after_first = true },
                templ = { 'templ' },
            },
        },
    },

    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'gopls',
                'goimports',
                'templ',
                'delve',
            },
        },
    },

    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = {
                ['gopls'] = function()
                    require('tvaintrob.utils.lsp').setup_server('gopls', {
                        settings = {
                            gopls = {
                                hints = {
                                    constantValues = true,
                                    parameterNames = true,
                                    rangeVariableTypes = true,
                                    assignVariableTypes = true,
                                    compositeLiteralTypes = true,
                                    compositeLiteralFields = true,
                                    functionTypeParameters = true,
                                },
                            },
                        },
                    })
                end,
            },
        },
    },

    -- {
    --   'leoluz/nvim-dap-go',
    --   ft = { 'go' },
    --   opts = {},
    -- },

    {
        'ray-x/go.nvim',
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup()
        end,
        ft = { 'go', 'gomod' },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
}
