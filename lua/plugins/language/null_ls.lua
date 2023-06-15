local M = {}

function M.config()
  local null_ls = require('null-ls')

  null_ls.setup({
    debug = true,
    sources = {
      null_ls.builtins.diagnostics.golangci_lint,

      null_ls.builtins.formatting.rustfmt,
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
  })
end

return M
