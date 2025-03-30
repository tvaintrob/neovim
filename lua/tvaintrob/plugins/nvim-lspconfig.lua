return {
    {
        'whoissethdaniel/mason-tool-installer.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {
            auto_update = true,
            run_on_start = true,
            ensure_installed = {
                'shfmt',
                'stylua',
                'lua-language-server',
                'bash-language-server',
            },
        },
    },

    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },

    {
        'neovim/nvim-lspconfig',
        event = 'LazyFile',
        dependencies = {
            { 'williamboman/mason.nvim', opts = {} },
            {
                'whoissethdaniel/mason-tool-installer.nvim',
                opts_extend = { 'ensure_installed' },
                opts = { ensure_installed = {} },
            },
            {
                'williamboman/mason-lspconfig.nvim',
                opts = {
                    handlers = {
                        require('tvaintrob.utils.lsp').setup_server,
                        ['lua_ls'] = function()
                            require('tvaintrob.utils.lsp').setup_server('lua_ls')
                        end,
                    },
                },
                config = function(_, opts)
                    require('mason-lspconfig').setup(opts)
                end,
            },
        },
    },
}
