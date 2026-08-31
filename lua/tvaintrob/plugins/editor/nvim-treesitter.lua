local function select_textobject(query)
    return function()
        require('nvim-treesitter-textobjects.select').select_textobject(query, 'textobjects')
    end
end

local function move(direction, query)
    return function()
        require('nvim-treesitter-textobjects.move')['goto_' .. direction](query, 'textobjects')
    end
end

return {
    { 'folke/ts-comments.nvim', event = 'LazyFile', opts = {} },

    {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
        opts = {
            enable_rename = false,
            enable_close_on_slash = false,
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup({})

            local function start(buf, lang)
                vim.treesitter.start(buf, lang)
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end

            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
                callback = function(ev)
                    local lang = vim.treesitter.language.get_lang(ev.match)
                    if not lang then
                        return
                    end

                    if pcall(start, ev.buf, lang) then
                        return
                    end

                    -- parser not installed yet, install it and retry
                    if
                        vim.tbl_contains(require('nvim-treesitter.config').get_available(), lang)
                    then
                        require('nvim-treesitter').install({ lang }):await(function()
                            if vim.api.nvim_buf_is_valid(ev.buf) then
                                pcall(start, ev.buf, lang)
                            end
                        end)
                    end
                end,
            })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        event = 'LazyFile',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            select = {
                lookahead = true,
                include_surrounding_whitespace = false,
                selection_modes = {
                    ['@function.outer'] = 'v', -- charwise
                    ['@conditional.outer'] = 'V', -- linewise
                    ['@loop.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
            },
            move = {
                set_jumps = true,
            },
        },
        keys = {
            -- stylua: ignore start
            { 'af', select_textobject('@function.outer'), mode = { 'x', 'o' }, desc = 'around a function' },
            { 'if', select_textobject('@function.inner'), mode = { 'x', 'o' }, desc = 'inner part of a function' },
            { 'ac', select_textobject('@class.outer'), mode = { 'x', 'o' }, desc = 'around a class' },
            { 'ic', select_textobject('@class.inner'), mode = { 'x', 'o' }, desc = 'inner part of a class' },
            { 'ai', select_textobject('@conditional.outer'), mode = { 'x', 'o' }, desc = 'around an if statement' },
            { 'ii', select_textobject('@conditional.inner'), mode = { 'x', 'o' }, desc = 'inner part of an if statement' },
            { 'al', select_textobject('@loop.outer'), mode = { 'x', 'o' }, desc = 'around a loop' },
            { 'il', select_textobject('@loop.inner'), mode = { 'x', 'o' }, desc = 'inner part of a loop' },

            { '[p', move('previous_start', '@parameter.inner'), mode = { 'n', 'x', 'o' }, desc = 'Previous parameter' },
            { '[f', move('previous_start', '@function.outer'), mode = { 'n', 'x', 'o' }, desc = 'Previous function' },
            { '[c', move('previous_start', '@class.outer'), mode = { 'n', 'x', 'o' }, desc = 'Previous class' },
            { ']p', move('next_start', '@parameter.inner'), mode = { 'n', 'x', 'o' }, desc = 'Next parameter' },
            { ']f', move('next_start', '@function.outer'), mode = { 'n', 'x', 'o' }, desc = 'Next function' },
            { ']c', move('next_start', '@class.outer'), mode = { 'n', 'x', 'o' }, desc = 'Next class' },
            -- stylua: ignore end
        },
    },
}
