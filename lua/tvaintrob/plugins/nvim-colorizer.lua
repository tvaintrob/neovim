return {
  'NvChad/nvim-colorizer.lua',
  event = 'LazyFile',
  opts = {
    filetypes = {
      '*',
      css = { names = true },
    },
    user_default_options = {
      css = true,
      mode = 'background',
      names = false,
      tailwind = true,
      always_update = true,
    },
  },
}
