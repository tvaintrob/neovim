-- Personal Neovim Configuration
-- https://github.com/tvaintrob/neovim

require('ft')
require('opts')
require('keymaps')

require('utils').ensure_package_manager({
  { import = 'layers.base' },
  { import = 'layers.intellisense' },
  { import = 'layers.editor' },
  { import = 'layers.debug' },
  { import = 'layers.ui' },
  { import = 'layers.ai' },
})
