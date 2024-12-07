return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        sql = { 'sql_formatter' },
      },
    },
  },

  {
    'whoissethdaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'sqls',
        'sql-formatter',
      },
    },
  },
}
