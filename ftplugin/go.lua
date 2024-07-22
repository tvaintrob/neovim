vim.cmd([[ iabbrev null nil ]])
vim.cmd([[ iabbrev nill nil ]])

vim.api.nvim_buf_create_user_command(0, 'GoModTidy', function()
  vim.cmd('! go mod tidy')
  vim.cmd('LspRestart')
end, {})
