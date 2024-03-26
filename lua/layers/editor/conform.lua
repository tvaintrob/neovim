return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  event = { 'BufWritePre' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'v', 'n' },
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports' },
      javascript = { { 'prettierd', 'prettier' } },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
