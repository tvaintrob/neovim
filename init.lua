-- Personal Neovim Configuration
-- https://github.com/tvaintrob/neovim

require('opts')
require('keymaps')

local lazy = require('utils').ensure_package_manager()

lazy.setup({
  { import = 'layers.base' },
  { import = 'layers.intellisense' },
  { import = 'layers.ui' },
}, {
  change_detection = { notify = false },
  install = { colorscheme = { 'vscode' } },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tutor',
        'tohtml',
        'matchit',
        'tarPlugin',
        'zipPlugin',
        'matchparen',
        'netrwPlugin',
      },
    },
  },
})
