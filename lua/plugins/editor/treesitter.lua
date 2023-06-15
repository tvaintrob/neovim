local M = {}

function M.config()
  local treesitter = require('nvim-treesitter.configs')

  vim.cmd('set foldmethod=expr')
  vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')

  treesitter.setup({
    ensure_installed = 'all',
    ignore_install = { 'haskell', 'phpdoc' },
    indent = { enable = true },
    autotag = { enable = true },
    endwise = { enable = true },
    highlight = { enable = true },
    context_commentstring = { enable = true },
  })
end

return M
