return {
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'tombi', -- for pyproject.toml
                'ruff',
                'pyright',
                'debugpy',
            },
        },
    },
}
