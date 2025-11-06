return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true, cmd = { 'DB' } },
            {
                'kristijanhusak/vim-dadbod-completion',
                ft = { 'sql', 'mysql', 'plsql' },
                lazy = true,
            },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        'saghen/blink.cmp',
        opts = {
            sources = {
                per_filetype = {
                    sql = { 'snippets', 'dadbod', 'buffer' },
                },
                providers = {
                    dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
                },
            },
        },
    },
}
