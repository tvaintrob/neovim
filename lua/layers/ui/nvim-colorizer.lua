return {
  'NvChad/nvim-colorizer.lua',
  event = 'LazyFile',
  config = function()
    require('colorizer').setup({
      filetypes = { '*' },
      user_default_options = {
        css = true,
        mode = 'background',
        tailwind = true,
        always_update = false,
      },
    })
  end,
}
