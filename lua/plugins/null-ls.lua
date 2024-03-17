return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    local null_ls = require('null-ls')

    local function null_ls_format()
      vim.lsp.buf.format({})
    end

    null_ls.setup({
      sources = {
        -- diagnostics
        null_ls.builtins.diagnostics.golangci_lint,

        -- formatting
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.prismaFmt,
        null_ls.builtins.formatting.buf,
        -- null_ls.builtins.formatting.isort,
        -- null_ls.builtins.formatting.black.with({ args = { '-' } }),
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.clang_format,
      },
      on_attach = function()
        vim.keymap.set({ 'n', 'v' }, '<leader>f', null_ls_format, { silent = true, noremap = true })
      end,
    })
  end,
}
