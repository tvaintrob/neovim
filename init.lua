-- Personal Neovim Configuration
-- https://github.com/tvaintrob/neovim

require('tvaintrob.opts')
require('tvaintrob.keymaps')
require('tvaintrob.autocmds')

-- install lazy.nvim and setup plugins
require('tvaintrob.utils.lazy').setup({
  -- load basic plugins
  { import = 'tvaintrob.plugins' },
  { import = 'tvaintrob.extras.completion' },
  { import = 'tvaintrob.extras.debug' },
  { import = 'tvaintrob.extras.linting' },

  -- add language support
  { import = 'tvaintrob.extras.language.go' },
  { import = 'tvaintrob.extras.language.python' },
  { import = 'tvaintrob.extras.language.typescript' },
  { import = 'tvaintrob.extras.language.docker' },
  { import = 'tvaintrob.extras.language.terraform' },
  { import = 'tvaintrob.extras.language.sql' },
  { import = 'tvaintrob.extras.language.toml' },
  { import = 'tvaintrob.extras.language.json' },
  { import = 'tvaintrob.extras.language.yaml' },
  { import = 'tvaintrob.extras.language.html' },
  { import = 'tvaintrob.extras.language.rust' },
  { import = 'tvaintrob.extras.language.clangd' },
  { import = 'tvaintrob.extras.language.markdown' },
})
