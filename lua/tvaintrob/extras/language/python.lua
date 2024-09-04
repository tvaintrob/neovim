return {
  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'ruff',
        'pyright',
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      handlers = {
        ['pyright'] = function()
          require('tvaintrob.utils.lsp').setup_server('pyright', {
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = 'off',
                },
              },
            },
          })
        end,
      },
    },
  },
}
