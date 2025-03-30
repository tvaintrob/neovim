return {
    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'rust-analyzer',
            },
        },
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = {
                ['rust_analyzer'] = function() end,
            },
        },
    },
}
