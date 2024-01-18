return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'windwp/nvim-ts-autotag' },
    { 'RRethy/nvim-treesitter-endwise' },
    { 'joosepalviste/nvim-ts-context-commentstring' },
  },

  config = function()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      ensure_installed = 'all',
      additional_vim_regex_highlighting = false,

      indent = { enable = true, disable = { 'python' } },
      autotag = {
        enable = true,
        enable_close_on_slash = false,
        filetypes = {
          'html',
          'javascript',
          'typescript',
          'javascriptreact',
          'typescriptreact',
          'svelte',
          'vue',
          'tsx',
          'jsx',
          'rescript',
          'xml',
          'php',
          'markdown',
          'astro',
          'glimmer',
          'handlebars',
          'hbs',
          'templ',
        },
      },
      endwise = { enable = true },
      highlight = { enable = true },
    })
  end,
}
