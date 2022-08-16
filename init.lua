require('core')

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true }),
  pattern = { '*.go', '*.lua' },
  callback = function()
    require('keymap.utils').format_buffer()
  end,
})
