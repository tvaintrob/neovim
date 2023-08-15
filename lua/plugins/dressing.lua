return {
  'stevearc/dressing.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'MunifTanjim/nui.nvim' },
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('dressing').setup({
      select = {
        backend = { 'telescope', 'builtin' },
        telescope = require('telescope.themes').get_cursor(),
      },
    })
  end,
}
