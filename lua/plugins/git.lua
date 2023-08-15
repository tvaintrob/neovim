return {
  {
    'f-person/git-blame.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.g.gitblame_date_format = '%r'
    end,
  },

  { 'lewis6991/gitsigns.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = true },
}
