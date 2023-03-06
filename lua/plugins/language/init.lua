local lspconfig = require('plugins.language.lspconfig')
local null_ls = require('plugins.language.null_ls')

return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'folke/neodev.nvim', config = true },
      { 'simrat39/rust-tools.nvim' },
      {
        'SmiteshP/nvim-navic',
        opts = {
          icons = {
            File = ' ',
            Module = ' ',
            Namespace = ' ',
            Package = ' ',
            Class = ' ',
            Method = ' ',
            Property = ' ',
            Field = ' ',
            Constructor = ' ',
            Enum = ' ',
            Interface = ' ',
            Function = ' ',
            Variable = ' ',
            Constant = ' ',
            String = ' ',
            Number = ' ',
            Boolean = ' ',
            Array = ' ',
            Object = ' ',
            Key = ' ',
            Null = ' ',
            EnumMember = ' ',
            Struct = ' ',
            Event = ' ',
            Operator = ' ',
            TypeParameter = ' ',
          },
        },
      },
    },
    config = lspconfig.config,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = null_ls.config,
  },

  {
    'williamboman/mason.nvim',
    config = true,
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim', config = true },
      {
        'whoissethdaniel/mason-tool-installer.nvim',
        opts = {
          auto_update = true,
          run_on_start = true,
          ensure_installed = {
            -- ensure lsp servers installed
            'gopls',
            'pyright',
            'css-lsp',
            'html-lsp',
            'json-lsp',
            'eslint-lsp',
            'rust-analyzer',
            'vim-language-server',
            'lua-language-server',
            'yaml-language-server',
            'bash-language-server',
            'prisma-language-server',
            'dockerfile-language-server',
            'typescript-language-server',
            'tailwindcss-language-server',

            -- ensure formatters installed
            'buf',
            'isort',
            'black',
            'shfmt',
            'stylua',
            'gofumpt',
            'rustfmt',
            'prettier',
            'goimports',
            'prettierd',

            -- ensure linters installed
            'hadolint',
            'golangci-lint',
          },
        },
      },
    },
  },
}
