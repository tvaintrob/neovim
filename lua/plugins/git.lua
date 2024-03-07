return {
  {
    'f-person/git-blame.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('gitblame').setup({
        enabled = true,
        date_format = '%r',
        highlight_group = 'CursorLineFold',
        ignored_filetypes = { 'toggleterm' },
      })
    end,
  },

  { 'lewis6991/gitsigns.nvim', event = { 'BufReadPost', 'BufNewFile' }, config = true },
}
