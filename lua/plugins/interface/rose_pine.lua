local M = {}

function M.config()
  require('rose-pine').setup({ dark_variant = 'moon' })
  vim.cmd('colorscheme rose-pine')
end

return M
