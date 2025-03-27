return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { 'prettier', stop_after_first = true },
        typescript = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
      },
    },
  },

  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'vtsls',
        'prettierd',
        'prettier',
        'angular-language-server',
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      handlers = {
        ['angularls'] = function()
          local util = require('lspconfig.util')
          require('tvaintrob.utils.lsp').setup_server('angularls', {
            root_dir = util.root_pattern('package.json'),
          })
        end,
      },
    },
  },
}
