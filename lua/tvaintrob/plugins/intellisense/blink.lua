return {
    {
        'saghen/blink.compat',
        version = '2.*',
        lazy = true,
        opts = {},
    },

    {
        'saghen/blink.cmp',
        event = { 'InsertEnter' },
        build = 'cargo build --release',
        dependencies = {
            'xzbdmw/colorful-menu.nvim',
            'rcarriga/cmp-dap',
        },
        opts_extend = { 'sources.default' },
        opts = {
            enabled = function()
                return not vim.tbl_contains({ 'DressingInput' }, vim.bo.filetype)
            end,
            keymap = { preset = 'enter' },
            cmdline = { enabled = false },
            signature = {
                enabled = true,
                window = {
                    border = 'rounded',
                    show_documentation = true,
                },
            },
            appearance = { nerd_font_variant = 'mono' },
            fuzzy = {
                implementation = 'prefer_rust_with_warning',
                sorts = { 'exact', 'score', 'sort_text' },
            },
            completion = {
                menu = {
                    max_height = 25,
                    border = 'rounded',
                    draw = {
                        treesitter = { 'lsp' },
                        columns = {
                            { 'label', 'label_description', gap = 1 },
                            { 'kind_icon', 'kind', gap = 1 },
                            { 'source_name' },
                        },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require('colorful-menu').blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require('colorful-menu').blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = { border = 'rounded' },
                },
                list = { selection = { preselect = true, auto_insert = false } },
            },
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                per_filetype = {
                    ['dap-repl'] = { 'dap' },
                    dapui_watches = { 'dap' },
                    dapui_hover = { 'dap' },
                },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                    dap = {
                        name = 'dap',
                        module = 'blink.compat.source',
                        enabled = function()
                            return require('cmp_dap').is_dap_buffer()
                        end,
                    },
                },
            },
        },
    },
}
