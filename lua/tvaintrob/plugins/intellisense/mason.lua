return {
    {
        'whoissethdaniel/mason-tool-installer.nvim',
        dependencies = { 'mason-org/mason.nvim' },
        opts_extend = { 'ensure_installed' },
        opts = {
            auto_update = true,
        },
    },
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {},
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            { 'neovim/nvim-lspconfig' },
        },
    },
}
