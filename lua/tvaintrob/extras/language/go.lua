return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        go = { 'goimports', 'gofmt', stop_after_first = true },
        templ = { 'templ' },
      },
    },
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        go = { 'golangcilint' },
      },
    },
  },

  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'gopls',
        'goimports',
        'golangci-lint',
        'templ',
        'delve',
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      handlers = {
        ['gopls'] = function()
          require('tvaintrob.utils.lsp').setup_server('gopls', {
            settings = {
              gopls = {
                hints = {
                  constantValues = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                  assignVariableTypes = true,
                  compositeLiteralTypes = true,
                  compositeLiteralFields = true,
                  functionTypeParameters = true,
                },
              },
            },
          })
        end,
      },
    },
  },

  {
    'leoluz/nvim-dap-go',
    ft = { 'go' },
    opts = {},
  },
}
