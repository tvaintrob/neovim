return {
    { 'nvim-lua/popup.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        cmd = 'Telescope',
        keys = {
            { '<c-p>', '<cmd>Telescope find_files<cr>' },
            { '<leader>pf', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live grep' },
            {
                '<leader>ps',
                '<cmd>Telescope lsp_workspace_symbols<cr>',
                desc = 'Telescope search symbols',
            },
        },
        dependencies = {
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup({
                defaults = {
                    prompt_prefix = '❯ ',
                    selection_caret = '❯ ',
                    mappings = {
                        i = {
                            ['<esc>'] = actions.close,
                            ['<c-j>'] = actions.move_selection_next,
                            ['<c-k>'] = actions.move_selection_previous,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_file_sorter = true,
                        override_generic_sorter = true,
                    },
                    ['ui-select'] = {
                        require('telescope.themes').get_cursor({}),
                    },
                },
            })

            -- load telescope extensions
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')
        end,
    },
}
