return {
  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'clangd',
        'cpplint',
        'clang-format',
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
      },
    },
  },

  {
    'p00f/clangd_extensions.nvim',
  },
}
