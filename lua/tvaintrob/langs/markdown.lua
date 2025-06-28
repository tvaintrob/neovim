return {
    {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
            ensure_installed = {
                'marksman',
                'prettierd',
                'prettier',
            },
        },
    },

    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                ['markdown'] = { 'prettierd', 'prettier', stop_after_first = true },
                ['markdown.mdx'] = { 'prettierd', 'prettier', stop_after_first = true },
            },
        },
    },

    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        ft = { 'markdown' },
        build = function()
            vim.fn['mkdp#util#install']()
        end,
    },
}
