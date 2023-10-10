return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'windwp/nvim-ts-autotag' },
    { 'RRethy/nvim-treesitter-endwise' },
    { 'joosepalviste/nvim-ts-context-commentstring' },
    { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = -1 } },
  },

  config = function()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      ensure_installed = 'all',
      additional_vim_regex_highlighting = false,

      indent = { enable = true, disable = { 'python' } },
      autotag = { enable = true, enable_close_on_slash = false },
      endwise = { enable = true },
      highlight = { enable = true },
      context_commentstring = { enable = true },
    })
  end,
}
