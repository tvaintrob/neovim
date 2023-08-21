return {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    local null_ls = require('null-ls')

    local function null_ls_format()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == 'null-ls'
        end,
      })
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.prismaFmt,
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black.with({ args = { '-' } }),
      },
      on_attach = function()
        vim.keymap.set('n', '<leader>f', null_ls_format, { silent = true, noremap = true })
      end,
    })
  end,
}
