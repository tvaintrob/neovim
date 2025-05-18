return {
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        version = false,
        opts = {
            provider = 'gemini',
            auto_suggestions_provider = 'gemini',
            behaviour = {
                enable_cursor_planning_mode = true,
            },
            gemini = {
                endpoint = 'https://generativelanguage.googleapis.com/v1beta/models',
                model = 'gemini-2.5-pro-exp-03-25',
                timeout = 30000,
                temperature = 0,
                max_tokens = 8192 * 4,
            },
        },
        build = 'make BUILD_FROM_SOURCE=true',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope.nvim',
            'nvim-treesitter/nvim-treesitter',
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = { file_types = { 'Avante' } },
                ft = { 'Avante' },
            },
        },
    },

    {
        'saghen/blink.cmp',
        dependencies = { 'Kaiser-Yang/blink-cmp-avante' },
        opts = {
            sources = {
                -- Add 'avante' to the list
                default = { 'avante' },
                providers = {
                    avante = {
                        module = 'blink-cmp-avante',
                        name = 'Avante',
                        opts = {},
                    },
                },
            },
        },
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                disabled_filetypes = {
                    statusline = { 'Avante', 'AvanteInput', 'AvanteSelectedFiles' },
                },
            },
        },
    },

    {
        'nvim-neo-tree/neo-tree.nvim',
        opts = {
            filesystem = {
                commands = {
                    avante_add_files = function(state)
                        local node = state.tree:get_node()
                        local filepath = node:get_id()
                        local relative_path = require('avante.utils').relative_path(filepath)
                        local sidebar = require('avante').get()

                        local open = sidebar:is_open()
                        -- ensure avante sidebar is open
                        if not open then
                            require('avante.api').ask()
                            sidebar = require('avante').get()
                        end

                        sidebar.file_selector:add_selected_file(relative_path)

                        -- remove neo tree buffer
                        if not open then
                            sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
                        end
                    end,
                },
                window = {
                    mappings = {
                        ['A'] = 'avante_add_files',
                    },
                },
            },
        },
    },
}
