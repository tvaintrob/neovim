local treesitter = require('nvim-treesitter.configs')
local ts_context = require('treesitter-context')

vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

treesitter.setup({
  ensure_installed = 'all',
  ignore_install = { 'haskell', 'phpdoc' },
  indent = { enable = true },
  autotag = { enable = true },
  endwise = { enable = true },
  highlight = { enable = true },
  context_commentstring = { enable = true },
})

ts_context.setup({ max_lines = -1 })

require('nvim-autopairs').setup({})
