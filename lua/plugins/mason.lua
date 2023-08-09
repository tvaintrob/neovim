return {
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
          'terraform-ls',

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
}