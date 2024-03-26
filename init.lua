-- Personal Neovim Configuration
-- https://github.com/tvaintrob/neovim

require('opts')
require('keymaps')

require('utils').ensure_package_manager({
  { import = 'layers.base' },
  { import = 'layers.intellisense' },
  { import = 'layers.editor' },
  { import = 'layers.ui' },
})
