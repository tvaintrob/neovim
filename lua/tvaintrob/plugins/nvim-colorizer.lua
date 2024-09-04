return {
  'NvChad/nvim-colorizer.lua',
  event = 'LazyFile',
  opts = {
    filetypes = {
      '*',
      python = { names = false },
    },
    user_default_options = {
      css = true,
      mode = 'background',
      tailwind = true,
      always_update = false,
    },
  },
}
