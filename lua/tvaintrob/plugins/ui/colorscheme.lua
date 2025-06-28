return {
    {
        'Mofiqul/vscode.nvim',
        priority = 1000,
        config = function()
            local colors = require('vscode.colors').get_colors()
            local opts = {
                italic_comments = true,
                underline_links = true,
                group_overrides = {
                    -- make cursorline more visible
                    CursorLine = { bg = '#303030' },
                    NeoTreeCursorLine = { bg = '#303030' },

                    -- make diff viewing more accurate
                    DiffAdd = { bg = '#373d29' },
                    DiffText = { bg = '#0000ff' },
                    DiffDelete = { bg = '#4b1818' },
                    DiffChange = { bg = '#0e2f44' },

                    -- highlight python keyword args
                    ['@variable.parameter.python'] = { fg = colors.vscBlueGreen },
                },
            }

            require('vscode').setup(opts)
            require('vscode').load()
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'lunarvim/darkplus.nvim' },
        opts = {
            options = {
                theme = 'darkplus',
            },
        },
    },
}
