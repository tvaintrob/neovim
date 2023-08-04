local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = 'all',
  additional_vim_regex_highlighting = false,

  indent = { enable = true },
  autotag = { enable = true },
  endwise = { enable = true },
  highlight = { enable = true },
  context_commentstring = { enable = true },
})
