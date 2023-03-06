local M = {}

function M.on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- set buffer local keymaps when attaching an LSP
  local opts = { silent = true, noremap = true, buffer = bufnr }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set('n', '<leader>ac', vim.lsp.buf.code_action, opts)
  vim.keymap.set(
    'n',
    '<leader>d',
    '<cmd>lua vim.diagnostic.open_float({ scope = "line", border = "single" })<cr>',
    opts
  )
end

M.handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' }),
}

M.server_defaults = {
  handlers = M.handlers,
  on_attach = M.on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

function M.override_with(opts)
  return vim.tbl_extend('force', M.server_defaults, opts)
end

return M
