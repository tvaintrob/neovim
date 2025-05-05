return {
    {
        'Davidyz/VectorCode',
        version = '*', -- optional, depending on whether you're on nightly or release
        build = 'pipx upgrade vectorcode', -- optional but recommended. This keeps your CLI up-to-date.
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'olimorris/codecompanion.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        keys = {
            {
                '<leader>cc',
                '<cmd>CodeCompanionChat Toggle<cr>',
                desc = 'Toggle CodeCompanion Chat',
            },
        },
        opts = {
            extensions = {
                vectorcode = {
                    opts = {
                        add_tool = true,
                    },
                },
            },
            display = {
                chat = {
                    show_settings = true,
                    start_in_insert_mode = true,
                },
            },
            strategies = {
                inline = { adapter = 'gemini' },
                chat = {
                    adapter = 'gemini',
                    slash_commands = {
                        ['git_files'] = {
                            description = 'List git files',
                            callback = function(chat)
                                local handle = io.popen('git ls-files')
                                if handle ~= nil then
                                    local result = handle:read('*a')
                                    handle:close()
                                    chat:add_reference(
                                        { role = 'user', content = result },
                                        'git',
                                        '<git_files>'
                                    )
                                else
                                    return vim.notify(
                                        'No git files available',
                                        vim.log.levels.INFO,
                                        { title = 'CodeCompanion' }
                                    )
                                end
                            end,
                            opts = {
                                contains_code = false,
                            },
                        },
                    },
                },
            },
        },
    },

    {
        'saghen/blink.cmp',
        opts = {
            sources = {
                per_filetype = {
                    codecompanion = { 'codecompanion' },
                },
            },
        },
    },
}
