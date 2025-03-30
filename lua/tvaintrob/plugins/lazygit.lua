return {
    { 'nvim-lua/plenary.nvim', lazy = true },
    {
        'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        keys = {
            { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
        },
    },
}
