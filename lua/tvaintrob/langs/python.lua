return {
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'taplo', -- for pyproject.toml
                'ruff',
                'pyright',
                'debugpy',
            },
        },
    },
}
