return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'LazyFile',
  config = function()
    require('ibl').setup({
      indent = { char = '▏' },
      scope = { enabled = false },
    })
  end,
}
