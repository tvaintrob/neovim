return {
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
    { 'petertriho/cmp-git', ft = 'gitcommit' },
    { 'davidsierradz/cmp-conventionalcommits', ft = 'gitcommit' },
    { 'xzbdmw/colorful-menu.nvim', opts = {}, lazy = true },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
        },
        init = function()
            local hl = vim.api.nvim_set_hl
            hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
            hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
            hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
            hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
            hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
            hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
            hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
            hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
            hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
            hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
            hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
        end,
        opts = function()
            local cmp = require('cmp')
            local cmptypes = require('cmp.types')
            return {
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    expandable_indicator = true,
                    fields = { 'abbr', 'kind', 'menu' },
                    format = require('tvaintrob.utils.cmp').format_item,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-j>'] = cmp.mapping.select_next_item({
                        behavior = cmptypes.cmp.SelectBehavior.Select,
                    }),
                    ['<C-k>'] = cmp.mapping.select_prev_item({
                        behavior = cmptypes.cmp.SelectBehavior.Select,
                    }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if vim.snippet.active({ direction = 1 }) then
                            vim.snippet.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function()
                        if vim.snippet.active({ direction = -1 }) then
                            vim.snippet.jump(-1)
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'vim-dadbod-completion' },
                }, {
                    { name = 'buffer' },
                }),
            }
        end,
        config = function(_, opts)
            require('cmp').setup(opts)
            require('cmp').setup.filetype('gitcommit', {
                sources = require('cmp').config.sources({
                    { name = 'git' },
                    { name = 'conventionalcommits' },
                }, {
                    { name = 'buffer' },
                }),
            })

            require('cmp').event:on(
                'confirm_done',
                require('nvim-autopairs.completion.cmp').on_confirm_done()
            )
        end,
    },
}
